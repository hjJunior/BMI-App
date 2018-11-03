import 'package:flutter/material.dart';

class SliderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(40, (i) => Expanded(
      child: Container(
        height: 2.0,
        decoration: BoxDecoration(
          color: i.isEven ? Theme.of(context).primaryColor : Colors.white
        ),
      ),
    )),
  );
}
