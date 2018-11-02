import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/components/genderCard/utils.dart';
import 'package:bmi_calculator/components/genderCard/genderLine.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';

class GenderIconTranslated extends StatelessWidget {
  static final Map<Gender, String> _genderImages = {
    Gender.female: "images/gender_female.svg",
    Gender.other: "images/gender_other.svg",
    Gender.male: "images/gender_male.svg",
  };

  final Gender gender;
  const GenderIconTranslated({Key key, this.gender}) : super(key: key);
  bool get _isOtherGender => gender == Gender.other;
  String get _assetName => _genderImages[gender];
  double _iconSize(BuildContext context) => screenAwareSize(_isOtherGender ? 22.0 : 16.0, context);
  double _genderLeftPadding(BuildContext context) => screenAwareSize(_isOtherGender ? 8.0 : 0.0, context);

  @override
  Widget build(BuildContext context) {
    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName,
        height: _iconSize(context),
        width: _iconSize(context),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -genderAngles[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: genderAngles[gender],
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }
}