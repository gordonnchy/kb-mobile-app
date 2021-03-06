import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/app_state/intervention_card_state/intervention_card_state.dart';
import 'package:kb_mobile_app/core/components/Intervention_bottom_navigation_bar_container.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/sub_page_app_bar.dart';
import 'package:kb_mobile_app/core/components/sup_page_body.dart';
import 'package:kb_mobile_app/core/utils/app_util.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/intervention_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_child_info_top_header.dart';
import 'package:kb_mobile_app/core/components/entry_form_save_button.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/constants/ovc_exit_constant.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_case_closure_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_case_transfer_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_caseplan_graduation_rediness_form.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_exit/ovc_exit_pages/child_exit_pages/pages/ovc_exit_information_form.dart';
import 'package:provider/provider.dart';
import 'components/ovc_exit_list_card.dart';
import 'components/ovc_exit_selection.dart';

class OvcChildExitHome extends StatelessWidget {
  final String label = 'Child Exit';
  final List<String> programStageIds = [];

  void onAddNewExit(BuildContext context, List<Events> events) async {
    List<String> programStageIdsWithData =
        events.map((Events event) => event.programStage).toList();
    Provider.of<ServiceFormState>(context, listen: false).resetFormState();
    Widget model = OvcChildExitSelection(
      programStageIdsWithData: programStageIdsWithData,
    );
    String exitResponse = await AppUtil.showPopUpModal(context, model, false);
    onRedirectToExitForm(context, exitResponse, true);
  }

  void onRedirectToExitForm(
      BuildContext context, String exitResponse, bool isEditableMode) {
    Provider.of<ServiceFormState>(context, listen: false)
        .updateFormEditabilityState(isEditableMode: isEditableMode);
    if (exitResponse != null) {
      exitResponse == 'Exit'
          ? Navigator.push(context,
              MaterialPageRoute(builder: (context) => OvcExitInformationForm()))
          : exitResponse == 'Transfer'
              ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OvcExitCaseTransferForm()))
              : exitResponse == 'Case closure'
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OvcExitCaseClosureForm()))
                  : exitResponse == 'Graduation'
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  OvcExitCasePlanGraduationRedinessForm()))
                      : print(exitResponse);
    }
  }

  void updateFormStateData(BuildContext context, Events eventData) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('eventDate', eventData.eventDate);
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState('eventId', eventData.event);
    for (Map datavalue in eventData.dataValues) {
      if (datavalue['value'] != '') {
        Provider.of<ServiceFormState>(context, listen: false)
            .setFormFieldState(datavalue['dataElement'], datavalue['value']);
      }
    }
  }

  void onViewExit(
    BuildContext context,
    String exitResponse,
    Events eventData,
  ) {
    bool isEditableMode = false;
    updateFormStateData(context, eventData);
    onRedirectToExitForm(context, exitResponse, isEditableMode);
  }

  void onEditExit(
    BuildContext context,
    String exitResponse,
    Events eventData,
  ) {
    bool isEditableMode = true;
    updateFormStateData(context, eventData);
    onRedirectToExitForm(context, exitResponse, isEditableMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.0),
          child: Consumer<IntervetionCardState>(
            builder: (context, intervetionCardState, child) {
              InterventionCard activeInterventionProgram =
                  intervetionCardState.currentIntervetionProgram;
              return SubPageAppBar(
                label: label,
                activeInterventionProgram: activeInterventionProgram,
              );
            },
          ),
        ),
        body: SubPageBody(
          body: Container(
            child: Column(children: [
              OvcChildInfoTopHeader(),
              Container(
                child: Consumer<ServiveEventDataState>(
                  builder: (context, serviveEventDataState, child) {
                    bool isLoading = serviveEventDataState.isLoading;
                    Map<String, List<Events>> eventListByProgramStage =
                        serviveEventDataState.eventListByProgramStage;
                    Map programStageMap =
                        OvcExitConstant.getOvcExitProgramStageMap();
                    for (var id in programStageMap.keys.toList()) {
                      programStageIds.add('$id');
                    }
                    List<Events> events = TrackedEntityInstanceUtil
                        .getAllEventListFromServiceDataStateByProgramStages(
                            eventListByProgramStage, programStageIds);
                    bool shouldAllowAddNewButton = events
                            .map((Events event) => event.programStage)
                            .toList()
                            .length <
                        programStageIds.toSet().toList().length;
                    return isLoading
                        ? CircularProcessLoader(
                            color: Colors.blueGrey,
                          )
                        : Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10.0),
                                child: events.length == 0
                                    ? Center(
                                        child: Text(
                                            'There is no any exit details at moment'),
                                      )
                                    : Column(
                                        children: events
                                            .map((Events eventData) =>
                                                OvcExitListCard(
                                                  eventData: eventData,
                                                  programStageMap:
                                                      programStageMap,
                                                  onEditExit: () {
                                                    String exitResponse =
                                                        programStageMap[
                                                            eventData
                                                                .programStage];
                                                    onEditExit(
                                                        context,
                                                        exitResponse,
                                                        eventData);
                                                  },
                                                  onViewExit: () {
                                                    String exitResponse =
                                                        programStageMap[
                                                            eventData
                                                                .programStage];
                                                    onViewExit(
                                                        context,
                                                        exitResponse,
                                                        eventData);
                                                  },
                                                ))
                                            .toList(),
                                      ),
                              ),
                              Visibility(
                                visible: shouldAllowAddNewButton,
                                child: Container(
                                    child: EntryFormSaveButton(
                                  label: 'ADD',
                                  labelColor: Colors.white,
                                  fontSize: 14,
                                  buttonColor: Color(0xFF4B9F46),
                                  onPressButton: () =>
                                      onAddNewExit(context, events),
                                )),
                              )
                            ],
                          );
                  },
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: InterventionBottomNavigationBarContainer());
  }
}
