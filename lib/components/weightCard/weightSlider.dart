import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class WeightSlider extends StatelessWidget {
  WeightSlider({
    Key key,
    @required this.minValue,
    @required this.maxValue,
    @required this.width,
    this.value,
    this.onChanged,
  }) : scrollController = new ScrollController(initialScrollOffset: (value - minValue) * width / 3),
       super(key: key);

  final int maxValue;
  final double width;
  final int minValue;
  final int value;
  final ValueChanged<int> onChanged;

  double get itemExtent => width / 3;
  int _indexToValue(int index) => minValue + (index - 1);
  int get itemCount => (maxValue - minValue) + 3;

  final ScrollController scrollController;


  TextStyle _getDefaultTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(196, 197, 203, 1.0),
      fontSize: 14.0,
    );
  }

  TextStyle _getHighlightTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(77, 123, 243, 1.0),
      fontSize: 28.0,
    );
  }


  TextStyle _getTextStyle(int itemValue) => itemValue == value ? _getHighlightTextStyle() : _getDefaultTextStyle();
  int _offsetToMiddleIndex(double offset) => (offset + width / 2) ~/ itemExtent;
  int _offsetToMiddleValue(double offset) {
    int indexOfMiddleElement = _offsetToMiddleIndex(offset);
    int middleValue = _indexToValue(indexOfMiddleElement);
    return middleValue;
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      int middleValue = _offsetToMiddleValue(notification.metrics.pixels);
      middleValue = math.max(minValue, math.min(maxValue, middleValue));

      if(_userStoppedScrolling(notification)) {
        _animateTo(middleValue);
      }

      if (middleValue != value) {
        onChanged(middleValue);
      }
    }
    return true;
  }

  bool _userStoppedScrolling(Notification notification) {
    return notification is UserScrollNotification &&
        notification.direction == ScrollDirection.idle &&
        scrollController.position.activity is! HoldScrollActivity;
  }

  _animateTo(int valueToSelect, {int durationMillis = 200}) {
    double targetExtent = (valueToSelect - minValue) * itemExtent;
    scrollController.animateTo(
      targetExtent,
      duration: new Duration(milliseconds: durationMillis),
      curve: Curves.decelerate,
    );
  }
  
  @override
  Widget build(BuildContext context) => NotificationListener(
    onNotification: _onNotification,
    child: ListView.builder(
      itemCount: itemCount,
      scrollDirection: Axis.horizontal,
      itemExtent: itemExtent,
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final int value = _indexToValue(index);
        bool isExtra = index == 0 || index == itemCount - 1;
        return isExtra ? new Container() : FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '${value}',
            style: _getTextStyle(value),
          ),
        );
      }
    ),
  );
}
