import 'package:kb_mobile_app/models/ovc_house_hold_child.dart';
import 'package:kb_mobile_app/models/tracked_entity_instance.dart';

class OvcHouseHold {
  String firstName;
  String middleName;
  String surname;
  String location;
  String houseHoldId;
  String ovcMaleCount;
  String ovcFemaleCount;
  List<OvcHouseHoldChild> children;
  TrackeEntityInstance teiData;

  OvcHouseHold({
    this.firstName,
    this.middleName,
    this.surname,
    this.ovcMaleCount,
    this.children,
    this.houseHoldId,
    this.location,
    this.ovcFemaleCount,
    this.teiData,
  });

  OvcHouseHold fromTeiModel(
    TrackeEntityInstance tei,
    String location,
    List<OvcHouseHoldChild> children,
  ) {
    List keys = [
      's1eRvsL2Ly4',
      's1HaiT6OllL',
      'rSP9c21JsfC',
      'kQehaqmaygZ',
      'BXUNH6LXeGA',
      'yk0OH9p09C1'
    ];
    Map data = Map();
    for (Map attributOj in tei.attributes) {
      String attribute = attributOj['attribute'];
      if (attribute != null && keys.indexOf(attribute) > -1) {
        data[attribute] = '${attributOj['value']}'.trim() ?? '';
      }
    }
    return OvcHouseHold(
        firstName: data['s1eRvsL2Ly4'] ?? '',
        middleName: data['s1HaiT6OllL'] ?? '',
        surname: data['rSP9c21JsfC'] ?? '',
        location: location,
        ovcMaleCount: data['kQehaqmaygZ'] ?? '',
        ovcFemaleCount: data['BXUNH6LXeGA'] ?? '',
        houseHoldId: data['yk0OH9p09C1'] ?? '',
        children: children,
        teiData: tei);
  }

  @override
  String toString() {
    return '$firstName $surname';
  }
}
