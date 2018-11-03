import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:bmi_calculator/components/heightCard/height_styles.dart';

class SliderLabel extends StatelessWidget {
  int height;
  SliderLabel({this.height});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      left: screenAwareSize(4.0, context),
      bottom: screenAwareSize(2.0, context)
    ),
    child: Text(
      '$height',
      style: TextStyle(
        fontSize: selectedLabelFontSize,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
