import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kb_mobile_app/models/input_field.dart';

class TrueOnlyInputFieldContainer extends StatefulWidget {
  const TrueOnlyInputFieldContainer(
      {Key key, @required this.inputField, @required this.onInputValueChange})
      : super(key: key);

  final InputField inputField;
  final Function onInputValueChange;

  @override
  _TrueOnlyInputFieldContainerState createState() =>
      _TrueOnlyInputFieldContainerState();
}

class _TrueOnlyInputFieldContainerState
    extends State<TrueOnlyInputFieldContainer> {
  bool _value;
  String _swithLabel;
  Color inActiveColor = Color(0xFF737373);

  @override
  void initState() {
    super.initState();
    onSetValue(widget.inputField.value ?? false);
  }

  onSetValue(bool value) {
    setState(() {
      _value = value;
      _swithLabel = value ? 'Yes' : 'No';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 30.0,
          margin: EdgeInsets.only(left: 5.0),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: Text(
            '$_swithLabel',
            style: TextStyle().copyWith(
                fontSize: 12.0,
                color: _value ? widget.inputField.color : inActiveColor),
          ),
        ),
        Container(
            child: CupertinoSwitch(
                activeColor: widget.inputField.color,
                trackColor: inActiveColor,
                value: _value,
                onChanged: (bool value) {
                  onSetValue(value);
                  widget.onInputValueChange(value ? value : '');
                })),
      ],
    );
  }
}