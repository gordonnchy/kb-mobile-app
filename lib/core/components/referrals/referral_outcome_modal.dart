import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/referral_nofitication_state/referral_nofitication_state.dart';
import 'package:kb_mobile_app/core/components/entry_forms/entry_form_container.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/skip_logics/ovc_referral_outcome.dart';
import 'package:provider/provider.dart';

class ReferralOutcomeModal extends StatefulWidget {
  const ReferralOutcomeModal(
      {Key key,
      @required this.themeColor,
      @required this.referralOutcomeFormSections,
      @required this.eventData,
      @required this.hiddenFields,
      @required this.referralToFollowUpLinkage,
      @required this.referralOutcomeMandatoryFields})
      : super(key: key);

  final Color themeColor;
  final List<FormSection> referralOutcomeFormSections;
  final Events eventData;
  final String referralToFollowUpLinkage;
  final List<String> hiddenFields;
  final List<String> referralOutcomeMandatoryFields;

  @override
  _ReferralOutcomeModalState createState() => _ReferralOutcomeModalState();
}

class _ReferralOutcomeModalState extends State<ReferralOutcomeModal> {
  bool isFormReady = false;
  bool isSaving = false;
  Map referralOutcomeMandatoryFieldsObject = Map();
  List unFilledMandatoryFields = [];

  @override
  void initState() {
    super.initState();
    isFormReady = true;
    for (String id in widget.referralOutcomeMandatoryFields ?? []) {
      referralOutcomeMandatoryFieldsObject[id] = true;
    }
    evaluateSkipLogics();
    Timer(Duration(seconds: 1), () {
      setState(() {});
    });
  }

  evaluateSkipLogics() {
    Timer(
      Duration(milliseconds: 200),
      () async {
        Map dataObject =
            Provider.of<ServiceFormState>(context, listen: false).formState;
        await OvcReferralOutcomeSkipLogic.evaluateSkipLogics(
          context,
          widget.referralOutcomeFormSections,
          dataObject,
        );
      },
    );
  }

  void onInputValueChange(String id, dynamic value) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(id, value);
    evaluateSkipLogics();
  }

  void onSaveForm(
    BuildContext context,
    Map dataObject,
    Events eventData,
  ) async {
    if (getReferralOutComeStatus(dataObject)) {
      bool hadAllMandatoryFilled = AppUtil.hasAllMandarotyFieldsFilled(
          widget.referralOutcomeMandatoryFields ?? [], dataObject);
      if (hadAllMandatoryFilled) {
        setState(() {
          isSaving = true;
        });
        try {
          bool isCompleted = true;
          bool isViewed = false;
          Provider.of<ReferralNotificationState>(context, listen: false)
              .updateReferralNotificaionEvent(
            eventData.event,
            eventData.trackedEntityInstance,
            isCompleted,
            isViewed,
          );
          dataObject[widget.referralToFollowUpLinkage] =
              dataObject[widget.referralToFollowUpLinkage] ?? AppUtil.getUid();
          await TrackedEntityInstanceUtil.savingTrackedEntityInstanceEventData(
            eventData.program,
            eventData.programStage,
            eventData.orgUnit,
            widget.referralOutcomeFormSections,
            dataObject,
            eventData.eventDate,
            eventData.trackedEntityInstance,
            eventData.event,
            widget.hiddenFields,
          );
          Provider.of<ServiveEventDataState>(context, listen: false)
              .resetServiceEventDataState(eventData.trackedEntityInstance);
          Timer(Duration(seconds: 1), () {
            setState(() {
              isSaving = false;
              String currentLanguage =
                  Provider.of<LanguageTranslationState>(context, listen: false)
                      .currentLanguage;
              AppUtil.showToastMessage(
                message: currentLanguage == 'lesotho'
                    ? 'Fomo e bolokeile'
                    : 'Form has been saved successfully',
                position: ToastGravity.TOP,
              );
              Navigator.pop(context);
            });
          });
        } catch (e) {
          Timer(Duration(seconds: 1), () {
            setState(() {
              isSaving = false;
              AppUtil.showToastMessage(
                  message: e.toString(), position: ToastGravity.BOTTOM);
              Navigator.pop(context);
            });
          });
        }
      } else {
        setState(() {
          unFilledMandatoryFields = AppUtil.getUnFilledMandatoryFields(
              widget.referralOutcomeMandatoryFields, dataObject);
        });
        AppUtil.showToastMessage(
          message: 'Please fill all mandatory field',
          position: ToastGravity.TOP,
        );
      }
    } else {
      AppUtil.showToastMessage(
          message: 'Please fill at least one form field',
          position: ToastGravity.TOP);
    }
  }

  bool getReferralOutComeStatus(Map dataObject) {
    bool isreferralOutcomeFilled = false;
    List<String> inputFields =
        FormUtil.getFormFieldIds(widget.referralOutcomeFormSections);
    for (String id in inputFields) {
      if (dataObject.containsKey(id) && '${dataObject[id]}'.trim() != '') {
        isreferralOutcomeFilled = true;
      }
    }
    return isreferralOutcomeFilled;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12.0)),
      child: Consumer<ServiceFormState>(
        builder: (context, serviceFormState, child) {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                    left: 13.0,
                    right: 13.0,
                  ),
                  child: EntryFormContainer(
                    hiddenSections: serviceFormState.hiddenSections,
                    hiddenFields: serviceFormState.hiddenFields,
                    elevation: 0.0,
                    formSections: widget.referralOutcomeFormSections,
                    mandatoryFieldObject: referralOutcomeMandatoryFieldsObject,
                    unFilledMandatoryFields: unFilledMandatoryFields,
                    dataObject: serviceFormState.formState,
                    isEditableMode: serviceFormState.isEditableMode,
                    onInputValueChange: onInputValueChange,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.themeColor,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => isSaving
                              ? null
                              : this.onSaveForm(
                                  context,
                                  serviceFormState.formState,
                                  widget.eventData,
                                ),
                          child: Text(
                            isSaving ? 'SAVING OUTCOME ...' : 'SAVE OUTCOME',
                            style: TextStyle().copyWith(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFAFAFA),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
