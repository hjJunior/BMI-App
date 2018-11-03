import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/heightCard/height_styles.dart';

class SliderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: circleSizeAdapted(context),
    height: circleSizeAdapted(context),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      shape: BoxShape.circle,
    ),
    child: Icon(
      Icons.unfold_more,
      color: Colors.white,
      size: 0.6 * circleSizeAdapted(context),
    ),
  );
}
