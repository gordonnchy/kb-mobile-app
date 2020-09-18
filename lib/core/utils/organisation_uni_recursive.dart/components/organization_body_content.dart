import 'package:flutter/material.dart';
import 'package:kb_mobile_app/core/utils/organisation_uni_recursive.dart/organisation_popUpMenu.dart';
import 'package:kb_mobile_app/models/organisation_unit.dart';

// ignore: must_be_immutable
class OrganisationContent extends StatelessWidget {
  BuildContext context;
  OrganisationUnit organisationUnit;
  List<Icon> onExpandIcon;
  bool onExpand;
  bool onExpandChildren;

  OrganisationContent(
      {context, this.organisationUnit, this.onExpandIcon, this.onExpand});
  @override
  Widget build(BuildContext context) {
    organisationUnit.children.length != null
        ? onExpandChildren = true
        : onExpandChildren = false;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
            visible: onExpand ? false : true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("              parent: "),
                    Text(
                      organisationUnit.parent,
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("level:      "),
                    Text(
                      organisationUnit.level.toString(),
                      style: TextStyle(
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onExpandChildren = !onExpandChildren;
                        (context as Element).markNeedsBuild();
                      },
                      child: Container(
                          padding: EdgeInsets.only(right: 0, left: 50),
                          color: Colors.transparent,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: onExpandChildren ? onExpandIcon[0] : onExpandIcon[1]),
                    ),
                    Visibility(
                      visible: onExpandChildren ? true : false,
                      child: Expanded(
                        child: Text(
                          "children",
                          style: TextStyle(
                              color: Colors.black26,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(child: OrganisationUnitPopUpMenu())
              ],
            )),
      ],
    );
  }
}
