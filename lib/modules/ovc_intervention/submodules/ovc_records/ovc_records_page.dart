import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/language_translation_state/language_translation_state.dart';
import 'package:kb_mobile_app/app_state/ovc_intervention_list_state/ovc_intervention_list_state.dart';
import 'package:kb_mobile_app/core/components/paginated_list_view.dart';
import 'package:kb_mobile_app/core/components/sub_module_home_container.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_body.dart';
import 'package:kb_mobile_app/modules/ovc_intervention/components/ovc_house_hold_card_botton_content.dart';
import 'package:provider/provider.dart';

class OvcRecordsPage extends StatefulWidget {
  const OvcRecordsPage({Key key}) : super(key: key);

  @override
  _OvcRecordsPageState createState() => _OvcRecordsPageState();
}

class _OvcRecordsPageState extends State<OvcRecordsPage> {
  final bool canEdit = false;
  final bool canView = true;
  final bool canExpand = true;
  final bool canAddChild = false;
  final bool canViewChildInfo = true;
  final bool canEditChildInfo = false;
  final bool canViewChildService = false;
  final bool canViewChildReferral = false;
  final bool canViewChildExit = false;

  String toggleCardId = '';

  void onCardToogle(String cardId) {
    setState(() {
      toggleCardId = canExpand && cardId != toggleCardId ? cardId : '';
    });
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
        builder: (context, ovcListState, child) => CustomPaginatedListView(
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
                  cardBottonActions: Container(),
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
            pagingController: ovcListState.pagingController,
            emptyListWidget: Center(
              child: Text(
                currentLanguage == 'lesotho'
                    ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                    : 'There is no household enrolled at moment',
              ),
            ),
            errorWidget: Center(
              child: Text(
                currentLanguage == 'lesotho'
                    ? 'Ha hona lelapa le ngolisitsoeng ha hajoale'
                    : 'There is no household enrolled at moment',
              ),
            )));
  }
}
