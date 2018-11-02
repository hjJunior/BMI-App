import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;
import 'package:bmi_calculator/components/genderCard/utils.dart' show defaultGenderAngle;

class GenderArrow extends AnimatedWidget {
  const GenderArrow({Key key, Listenable listenable}) : super(key: key, listenable: listenable);

  double _arrowLength(BuildContext context) => screenAwareSize(32.0, context);
  double _translationOffset(BuildContext context) => _arrowLength(context) * -0.4;

  @override
  Widget build(BuildContext context) => Transform.rotate(
    angle: (listenable as Animation).value,
    child: Transform.translate(
      offset: Offset(0.0, _translationOffset(context)),
      child: Transform.rotate(
        angle: -defaultGenderAngle,
        child: SvgPicture.asset(
          "images/gender_arrow.svg",
          height: _arrowLength(context),
          width: _arrowLength(context),
        ),
      ),
    ),
  );
}