import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/device_connectivity_state/device_connectivity_state.dart';
import 'package:kb_mobile_app/app_state/referral_nofitication_state/referral_nofitication_state.dart';
import 'package:kb_mobile_app/app_state/synchronization_state/synchronization_state.dart';
import 'package:kb_mobile_app/core/services/referral_notification_service.dart';
import 'package:kb_mobile_app/modules/synchronization/synchronization.dart';

class DataDownloadMessage extends StatefulWidget {
  @override
  _DataDownloadMessageState createState() => _DataDownloadMessageState();
}

class _DataDownloadMessageState extends State<DataDownloadMessage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      checkForAvailableBeneficiaryDataFromServer();
    });
  }

  void onOpenSyncModule(BuildContext context, bool isCheckingForAvailableData) {
    if (!isCheckingForAvailableData) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Synchronization(),
        ),
      );
    }
  }

  void checkForAvailableBeneficiaryDataFromServer() async {
    await ReferralNotificationService().syncReferralNotifications();
    await Provider.of<ReferralNotificationState>(context, listen: false)
        .reloadReferralNotifications();
    Timer(Duration(milliseconds: 200), () {
      bool connected =
          Provider.of<DeviceConnectivityState>(context, listen: false)
              .connectivityStatus;
      if (connected) {
        Provider.of<SynchronizationState>(context, listen: false)
            .checkingForAvaiableBeneficiaryData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SynchronizationState>(
      builder: (context, synchronizationState, child) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child:
                synchronizationState.statusMessageForAvailableDataFromServer !=
                        ''
                    ? Container(
                        child: GestureDetector(
                          onTap: () => onOpenSyncModule(
                              context,
                              synchronizationState
                                  .isCheckingForAvailableDataFromServer),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                synchronizationState
                                    .statusMessageForAvailableDataFromServer,
                                style: TextStyle(color: Colors.white),
                              ),
                              Visibility(
                                visible: !synchronizationState
                                    .isCheckingForAvailableDataFromServer,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5.0),
                                  child: Icon(
                                    Icons.download_sharp,
                                    color: Colors.white,
                                    size: 18.0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : Text(''));
      },
    );
  }
}
