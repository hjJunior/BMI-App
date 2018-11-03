import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/genderCard.dart';
import 'package:bmi_calculator/components/weightCard.dart';
import 'package:bmi_calculator/components/heightCard.dart';
import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;

class HomePage extends StatelessWidget {

  Widget _buildTitle(BuildContext context) => Padding(
    padding: EdgeInsets.only(
      left: 24.0,
      top: screenAwareSize(56.0, context)
    ),
    child: Text('BMI Calculator', style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),),
  );

  Widget _buildBottom(BuildContext context) => Container(
    alignment: Alignment.center,
    height: screenAwareSize(108.0, context),
    width: double.infinity,
    child: Switch(value: true, onChanged: (val) {}),
  );


  Widget _buildCards(BuildContext context) => Padding(
      padding: EdgeInsets.only(
        left: 14.0,
        right: 14.0,
        top: screenAwareSize(32.0, context),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(child: GenderCard(initialGender: Gender.other)),
                Expanded(child: WeightCard()),
              ],
            ),
          ),
          Expanded(child: HeightCard(initialHeight: 170))
        ],
      ),
    );

  Widget _tempCard(String label) => Card(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Text(label),
    ),
  );


  @override
  Widget build(BuildContext context) => Scaffold(
    body: Padding(
      padding: MediaQuery.of(context).padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitle(context),
          Expanded(child: _buildCards(context)),
          _buildBottom(context),
        ],
      ),
    ),
  );
}

