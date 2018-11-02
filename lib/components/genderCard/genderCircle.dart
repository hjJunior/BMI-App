import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/genderCard/utils.dart' show circleSize;

class GenderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: circleSize(context),
    height: circleSize(context),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromRGBO(244, 244, 244, 1.0),
    ),
  );
}