import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/components/cardTitle.dart';
import 'package:bmi_calculator/components/genderCard/genderIconTranslated.dart';
import 'package:bmi_calculator/components/genderCard/genderArrow.dart';
import 'package:bmi_calculator/components/genderCard/genderCircle.dart';
import 'package:bmi_calculator/components/genderCard/tapHandler.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;
import 'package:bmi_calculator/components/genderCard/utils.dart';


class GenderCard extends StatefulWidget {
  final Gender initialGender;
  const GenderCard({Key key, this.initialGender}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> with SingleTickerProviderStateMixin {
  AnimationController _arrowAnimationController;
  Gender selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.initialGender ?? Gender.other;
    _arrowAnimationController = AnimationController(
      vsync: this,
      lowerBound: -defaultGenderAngle,
      upperBound: defaultGenderAngle
    );
  }

  Widget _drawMainStack() => Container(
    width: double.infinity,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        _drawCircleIndicator(),
        GenderIconTranslated(gender: Gender.female),
        GenderIconTranslated(gender: Gender.other),
        GenderIconTranslated(gender: Gender.male),
        _drawGestureDetector()
      ],
    ),
  );

  Widget _drawCircleIndicator() => Stack(
    alignment: Alignment.center,
    children: <Widget>[
      GenderCircle(),
      GenderArrow(listenable: _arrowAnimationController),
    ],
  );

  _drawGestureDetector() => Positioned.fill(
    child: TapHandler(
      onGenderTapped: _setSelectedGender,
    ),
  );

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }


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

  _setSelectedGender(Gender gender) {
    setState(() => selectedGender = gender);

    _arrowAnimationController.animateTo(
      genderAngles[gender],
      duration: Duration(milliseconds: 350),
    );
  }
}
