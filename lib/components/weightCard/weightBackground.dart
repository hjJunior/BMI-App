import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:flutter_svg/svg.dart';

class WeightBackground extends StatelessWidget {
  final Widget child;
  const WeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      Container(
        height: screenAwareSize(100.0, context),
        child: child,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 244, 244, 1.0),
          borderRadius: BorderRadius.circular(screenAwareSize(50.0, context))
        ),
      ),
      SvgPicture.asset(
        'images/weight_arrow.svg',
        height: screenAwareSize(10.0, context),
        width: screenAwareSize(18.0, context),
      )
    ],
  );
}
