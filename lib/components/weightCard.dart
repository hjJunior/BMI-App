import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:bmi_calculator/components/cardTitle.dart';
import 'package:bmi_calculator/components/weightCard/weightBackground.dart';
import 'package:bmi_calculator/components/weightCard/weightSlider.dart';

class WeightCard extends StatefulWidget {
  int initialWeight;
  WeightCard({this.initialWeight});

  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  int weight;

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) => constraints.isTight ? Container() : WeightSlider(
          minValue: 30,
          maxValue: 110,
          width: constraints.maxWidth,
          value: weight,
          onChanged: (value) {
            print('onChanged actual value: ${value.toString()}');
            setState(() => weight = value);
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    weight = widget.initialWeight ?? 70;
  }

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: EdgeInsets.only(top: screenAwareSize(32.0, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CardTitle('WEIGHT', subtitle: '(kg)'),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _drawSlider(),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
