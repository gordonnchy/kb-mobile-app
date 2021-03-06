import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/core/components/circular_process_loader.dart';
import 'package:kb_mobile_app/core/components/line_seperator.dart';
import 'package:kb_mobile_app/core/components/referrals/referral_outcome_view.dart';
import 'package:kb_mobile_app/core/utils/tracked_entity_instance_util.dart';
import 'package:kb_mobile_app/models/events.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/referral_outcome_event.dart';
import 'package:kb_mobile_app/models/referral_outcome_follow_up_event.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';
import 'package:provider/provider.dart';

class ReferralOutComeViewContainer extends StatefulWidget {
  const ReferralOutComeViewContainer(
      {Key key,
      @required this.themeColor,
      @required this.eventData,
      @required this.beneficiary,
      @required this.referralFollowUpStage,
      @required this.referralToFollowUpLinkage,
      @required this.referralProgram,
      @required this.isEditableMode,
      @required this.referralOutcomeFollowUpFormSections,
      @required this.onEditReferralOutCome})
      : super(key: key);

  final Color themeColor;
  final Events eventData;
  final TrackeEntityInstance beneficiary;
  final String referralFollowUpStage;
  final String referralToFollowUpLinkage;
  final String referralProgram;
  final bool isEditableMode;
  final List<FormSection> referralOutcomeFollowUpFormSections;
  final Function onEditReferralOutCome;

  @override
  _ReferralOutComeViewContainerState createState() =>
      _ReferralOutComeViewContainerState();
}

class _ReferralOutComeViewContainerState
    extends State<ReferralOutComeViewContainer> {
  ReferralOutComeEvent referralOutComeEvent;
  bool isViewReady = false;
  double editIconHeight = 20;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(
        seconds: 1,
      ),
      () {
        setState(
          () {
            isViewReady = true;
            referralOutComeEvent = ReferralOutComeEvent().fromTeiModel(
                widget.eventData, widget.referralToFollowUpLinkage);
          },
        );
      },
    );
  }

  List<ReferralOutFollowUpComeEvent> getReferralOutComeFollowUps(
    Map<String, List<Events>> eventListByProgramStage,
  ) {
    TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      [widget.referralFollowUpStage],
    );
    List<Events> events = TrackedEntityInstanceUtil
        .getAllEventListFromServiceDataStateByProgramStages(
      eventListByProgramStage,
      [widget.referralFollowUpStage],
    );
    List<ReferralOutFollowUpComeEvent> referralOutComeFollowUps = events
        .map((Events event) => ReferralOutFollowUpComeEvent()
            .fromTeiModel(event, widget.referralToFollowUpLinkage))
        .toList();
    return referralOutComeFollowUps
        .where((referralOutComeFollowUp) =>
            referralOutComeFollowUp.referralReference ==
            referralOutComeEvent.referralReference)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return !isViewReady
        ? Container(
            child: CircularProcessLoader(
              color: Colors.blueGrey,
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFB2B7B9),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          child: Text(
                            'OUTCOME',
                            style: TextStyle().copyWith(
                              color: Color(0xFF1A3518),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Container(child: Consumer<ServiveEventDataState>(
                          builder: (context, serviveEventDataState, child) {
                        Map<String, List<Events>> eventListByProgramStage =
                            serviveEventDataState.eventListByProgramStage;
                        List<ReferralOutFollowUpComeEvent>
                            referralOutComeFollowUpEvents =
                            getReferralOutComeFollowUps(
                                eventListByProgramStage);
                        return Visibility(
                            visible: widget.isEditableMode &&
                                referralOutComeEvent != null &&
                                referralOutComeFollowUpEvents.length == 0,
                            child: InkWell(
                                onTap: widget.onEditReferralOutCome,
                                child: Container(
                                  height: editIconHeight,
                                  width: editIconHeight,
                                  margin: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 20.0,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/edit-icon.svg',
                                    color: widget.themeColor,
                                  ),
                                )));
                      }))
                    ],
                  ),
                  LineSeperator(
                    color: Color(0xFFB2B7B9),
                    height: 1.0,
                  ),
                  Container(
                    child: ReferralOutComeView(
                      isEditableMode: widget.isEditableMode,
                      referralOutComeEvent: referralOutComeEvent,
                      beneficiary: widget.beneficiary,
                      referralOutcomeFollowUpFormSections:
                          widget.referralOutcomeFollowUpFormSections,
                      themeColor: widget.themeColor,
                      referralFollowUpStage: widget.referralFollowUpStage,
                      referralProgram: widget.referralProgram,
                      referralToFollowUpLinkage:
                          widget.referralToFollowUpLinkage,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
