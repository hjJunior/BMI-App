import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart';
import 'package:bmi_calculator/components/heightCard/heightPicker.dart';
import 'package:bmi_calculator/components/cardTitle.dart';

class HeightCard extends StatefulWidget {
  final int initialHeight;
  const HeightCard({Key key, this.initialHeight}) : super(key: key);

  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  int height;

  @override
  void initState() {
    super.initState();
    height = widget.initialHeight ?? 170;
  }

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: EdgeInsets.only(top: screenAwareSize(16.0, context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CardTitle('HEIGHT', subtitle: '(cm)'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenAwareSize(8.0, context)),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) => HeightPicker(
                  widgetHeight: constraints.maxHeight,
                  height: height,
                  onChange: (val) => setState(() => height = val),
                )
              ),
            ),
          )
        ],
      ),
    ),
  );
}
