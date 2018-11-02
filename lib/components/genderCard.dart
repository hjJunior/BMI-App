import 'package:flutter/material.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/components/cardTitle.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;

double _circleSize(BuildContext context) => screenAwareSize(80.0, context);

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
    ],
  );

  Widget _drawCircleIndicator() => Stack(
    alignment: Alignment.center,
    children: <Widget>[
      GenderCircle(),
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

class GenderCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    width: _circleSize(context),
    height: _circleSize(context),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromRGBO(244, 244, 244, 1.0),
    ),
  );
}