import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/ovc_house_hold_current_selection_state.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_event_data_state.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/models/ovc_house_hold.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/submodules/ovc_referral/ovc_referral_pages/ovc_house_referral_pages/ovc_house_hold_referral_home.dart';
import 'package:provider/provider.dart';

class OvcReferralPage extends StatefulWidget {
  const OvcReferralPage({Key key}) : super(key: key);

  @override
  _OvcReferralPageState createState() => _OvcReferralPageState();
}

class _OvcReferralPageState extends State<OvcReferralPage> {
  final bool canEdit = false;
  final bool canView = false;
  final bool canExpand = true;
  final bool canAddChild = false;
  final bool canViewChildInfo = false;
  final bool canEditChildInfo = false;
  final bool canViewChildService = false;
  final bool canViewChildReferral = true;
  final bool canViewChildExit = false;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
  }

  void setOvcHouseHoldCurrentSelection(
      BuildContext context, OvcHouseHold ovcHouseHold) {
    Provider.of<OvcHouseHoldCurrentSelectionState>(context, listen: false)
        .setCurrentHouseHold(ovcHouseHold);
    Provider.of<ServiveEventDataState>(context, listen: false)
        .resetServiceEventDataState(ovcHouseHold.id);
  }

  void onViewRerral(BuildContext context, OvcHouseHold ovcHouseHold) {
    setOvcHouseHoldCurrentSelection(context, ovcHouseHold);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OvcHouseHoldReferralHome()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<LanguageTranslationState>(
        builder: (context, languageTranslationState, child) {
          String currentLanguage = languageTranslationState.currentLanguage;
          return Consumer<OvcInterventionListState>(
            builder: (context, ovcInterventionListState, child) {
              String header = currentLanguage == 'lesotho'
                  ? 'Lethathamo la malapa'.toUpperCase() +
                      ': ${ovcInterventionListState.numberOfHouseHolds} Malapa'
                  : 'Household list'.toUpperCase() +
                      ': ${ovcInterventionListState.numberOfHouseHolds} households';
              return SubModuleHomeContainer(
                header: header,
                bodyContents: _buildBody(currentLanguage),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(String currentLanguage) {
    return Consumer<OvcInterventionListState>(
      builder: (context, ovcList, child) => CustomPaginatedListView(
        pagingController: ovcList.pagingController,
        errorWidget: Center(
          child: Text(
            currentLanguage == 'lesotho'
                ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                : 'There is no household enrolled at moment',
          ),
        ),
        emptyListWidget: Center(
          child: Text(
            currentLanguage == 'lesotho'
                ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                : 'There is no household enrolled at moment',
          ),
        ),
        childBuilder: (context, ovcHouseHold, index) => OvcHouseHoldCard(
          ovcHouseHold: ovcHouseHold,
          canEdit: canEdit,
          canExpand: canExpand,
          canView: canView,
          isExpanded: ovcHouseHold.id == toggleCardId,
          onCardToogle: () {
            onCardToogle(ovcHouseHold.id);
          },
          cardBody: OvcHouseHoldCardBody(
            ovcHouseHold: ovcHouseHold,
          ),
          cardBottonActions: ClipRRect(
            borderRadius: ovcHouseHold.id == toggleCardId
                ? BorderRadius.zero
                : BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0XFFF6FAF6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: TextButton(
                      onPressed: () => onViewRerral(
                        context,
                        ovcHouseHold,
                      ),
                      child: Text(
                        'REFERRAL',
                        style: TextStyle().copyWith(
                          fontSize: 12.0,
                          color: Color(0xFF4B9F46),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          cardBottonContent: OvcHouseHoldCardBottonContent(
            currentLanguage: currentLanguage,
            ovcHouseHold: ovcHouseHold,
            canAddChild: canAddChild,
            canViewChildInfo: canViewChildInfo,
            canEditChildInfo: canEditChildInfo,
            canViewChildService: canViewChildService,
            canViewChildReferral: canViewChildReferral,
            canViewChildExit: canViewChildExit,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
