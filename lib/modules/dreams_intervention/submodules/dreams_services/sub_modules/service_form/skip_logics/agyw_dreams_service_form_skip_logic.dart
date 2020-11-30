import 'package:flutter/material.dart';
import 'package:kb_mobile_app/app_state/enrollment_service_form_state/service_form_state.dart';
import 'package:kb_mobile_app/core/utils/form_util.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:provider/provider.dart';

class AgywDreamsServiceFormSkipLogic {
  static Map hiddenFields = Map();
  static Map hiddenSections = Map();

  static Future evaluateSkipLogics(
    BuildContext context,
    List<FormSection> formSections,
    Map dataObject,
  ) async {
    hiddenFields.clear();
    hiddenSections.clear();
    List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections);
    for (var key in dataObject.keys) {
      inputFieldIds.add('$key');
    }
    inputFieldIds = inputFieldIds.toSet().toList();
    for (String inputFieldId in inputFieldIds) {
      String value = '${dataObject[inputFieldId]}';
      //  @TODO Add skip logics
    }
    for (String sectionId in hiddenSections.keys) {
      List<String> inputFieldIds = FormUtil.getFormFieldIds(formSections
          .where((formSection) => formSection.id == sectionId)
          .toList());
      for (String inputFieldId in inputFieldIds) {
        hiddenFields[inputFieldId] = true;
      }
    }
    resetValuesForHiddenFields(context, hiddenFields.keys);
    resetValuesForHiddenSections(context, formSections);
  }

  static bool evaluateSkipLogicsBySession(Map dataObject) {
    String interventionType = dataObject['Eug4BXDFLym'] ?? '';
    int sessions = dataObject['vL6NpUA0rIU'] != null
        ? int.parse(dataObject['vL6NpUA0rIU'])
        : 0;
    if (interventionType == 'AFLATEEN/TOUN' && sessions <= 12) {
      return true;
    }
    if (interventionType == 'PTS 4-GRADS' && sessions <= 10) {
      return true;
    }
    if (interventionType == 'PTS 4 NON-GRADS' && sessions <= 11) {
      return true;
    }
    if (interventionType == 'Go Girls' && sessions <= 15) {
      return true;
    }
    if (interventionType == 'SILC' && sessions <= 12) {
      return true;
    }
    if (interventionType == 'SAVING GROUP' && sessions <= 12) {
      return true;
    }
    if (interventionType == 'FINANCIAL EDUCATION' && sessions <= 4) {
      return true;
    }
    if (interventionType == 'STEPPING STONES' && sessions <= 11) {
      return true;
    }
    if (interventionType == 'IPC' && sessions <= 4) {
      return true;
    }
    if (interventionType == 'LBSE' && sessions <= 6) {
      return true;
    }
    if (interventionType == 'PARENTING' && sessions <= 14) {
      return true;
    }
    if (interventionType == 'GBV Legal' && sessions <= 1) {
      return true;
    }
    if (interventionType == 'VAC Legal' && sessions <= 1) {
      return true;
    }
    return false;
  }

  static resetValuesForHiddenFields(BuildContext context, inputFieldIds) {
    for (String inputFieldId in inputFieldIds) {
      if (hiddenFields[inputFieldId]) {
        assignInputFieldValue(context, inputFieldId, null);
      }
    }
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenFields(hiddenFields);
  }

  static resetValuesForHiddenSections(
    BuildContext context,
    List<FormSection> formSections,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setHiddenSections(hiddenSections);
  }

  static assignInputFieldValue(
    BuildContext context,
    String inputFieldId,
    String value,
  ) {
    Provider.of<ServiceFormState>(context, listen: false)
        .setFormFieldState(inputFieldId, value);
  }
}
