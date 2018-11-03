import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:bmi_calculator/components/cardTitle.dart';

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: EdgeInsets.only(top: screenAwareSize(32.0, context)),
      child: Column(
        children: <Widget>[
          CardTitle('WEIGHT', subtitle: '(kg)'),
          Container()
        ],
      ),
    ),
  );
}
