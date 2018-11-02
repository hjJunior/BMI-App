import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/components/cardTitle.dart';
import 'package:bmi_calculator/components/genderCard/genderIconTranslated.dart';
import 'package:bmi_calculator/components/genderCard/genderArrow.dart';
import 'package:bmi_calculator/components/genderCard/genderCircle.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;
import 'package:bmi_calculator/components/genderCard/utils.dart' show genderAngles;


class GenderCard extends StatefulWidget {
  final Gender initialGender;
  const GenderCard({Key key, this.initialGender}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {

  Widget _drawMainStack() => Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      _drawCircleIndicator(),
      GenderIconTranslated(gender: Gender.female),
      GenderIconTranslated(gender: Gender.other),
      GenderIconTranslated(gender: Gender.male),
    ],
  );

  Widget _drawCircleIndicator() => Stack(
    alignment: Alignment.center,
    children: <Widget>[
      GenderCircle(),
      GenderArrow(angle: genderAngles[Gender.female]),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: screenAwareSize(8.0, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CardTitle("GENDER"),
              Padding(
                padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
                child: _drawMainStack(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
