import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/heightCard/sliderLine.dart';
import 'package:bmi_calculator/components/heightCard/sliderCircle.dart';
import 'package:bmi_calculator/components/heightCard/sliderLabel.dart';

class HeightSlider extends StatelessWidget {
  final int height;
  const HeightSlider({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SliderLabel(height: height),
        Row(
          children: <Widget>[
            SliderCircle(),
            Expanded(
              child: SliderLine(),
            )
          ],
        )
      ],
    ),
  );
}
