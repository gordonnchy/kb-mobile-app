import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/form_section.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class DreamsGoGirlsInfo{
  static List<FormSection> getFormSections() {
    return [    
      FormSection(
          name: 'Go Girls',
          color: Color(0xFF737373),
          inputFields: [
            InputField(
              id: 'lvT9gfpHIlT',
              name: 'Date service was provided',
              valueType: 'DATE',
              inputColor: Color(0xFF258DCC),
              labelColor: Color(0xFF737373),),
            InputField(
                id: 'AUwXd4NrSwG',
                name: 'Go Girls',
                valueType: 'TRUE_ONLY',
                inputColor: Color(0xFF258DCC),
                labelColor: Color(0xFF737373),  ),

          ])
    ];
  }
}
