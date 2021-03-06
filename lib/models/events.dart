import 'dart:convert';

class Events {
  String event;
  String eventDate;
  String program;
  String programStage;
  String trackedEntityInstance;
  String status;
  String orgUnit;
  String syncStatus;
  dynamic dataValues;

  Events({
    this.event,
    this.eventDate,
    this.program,
    this.programStage,
    this.trackedEntityInstance,
    this.status,
    this.orgUnit,
    this.syncStatus,
    this.dataValues,
  });

  @override
  String toString() {
    return 'event <$event>';
  }

  Events fromJson(dynamic json) {
    return Events(
        event: json['event'],
        eventDate: "${json['eventDate']}".split('T')[0],
        program: json['program'],
        programStage: json['programStage'],
        trackedEntityInstance: json['trackedEntityInstance'] ?? '',
        orgUnit: json['orgUnit'],
        status: json['status'],
        dataValues: json['dataValues'],
        syncStatus: json['syncStatus'] ?? 'synced');
  }

  String toJson(Events event) {
    return json.encode(toOffline(event));
  }

  Map toOffline(Events eventData) {
    Map mapData = Map<String, dynamic>();
    mapData['event'] = eventData.event;
    mapData['eventDate'] = eventData.eventDate;
    mapData['program'] = eventData.program;
    mapData['programStage'] = eventData.programStage;
    mapData['trackedEntityInstance'] = eventData.trackedEntityInstance;
    mapData['status'] = eventData.status;
    mapData['orgUnit'] = eventData.orgUnit;
    mapData['syncStatus'] = eventData.syncStatus;
    mapData['dataValues'] = eventData.dataValues;

    return mapData;
  }

  Events.fromOffline(Map<String, dynamic> mapData) {
    this.event = mapData['event'];
    this.eventDate = mapData['eventDate'];
    this.program = mapData['program'];
    this.programStage = mapData['programStage'];
    this.trackedEntityInstance = mapData['trackedEntityInstance'];
    this.status = mapData['status'];
    this.orgUnit = mapData['orgUnit'];
    this.syncStatus = mapData['syncStatus'];
    this.dataValues = mapData['dataValues'];
  }
}
