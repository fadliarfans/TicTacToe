import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Cell extends StatefulWidget {
  Cell({
    this.counter,
    this.value,
    Key key,
    this.callBack,
  }) : super(key: key);
  set setValue(bool newValue) {
    value = newValue;
  }

  final ValueNotifier<int> counter;
  var value;
  final Function callBack;
  @override
  _CellState createState() => _CellState();
}

class _CellState extends State<Cell> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width / 3,
      width: width / 3,
      child: GestureDetector(
        onTap: () {
          if (widget.counter.value == 0) {
            if (widget.value)
              widget.counter.value = 1;
            else
              widget.counter.value = 2;
            widget.callBack();
          }
        },
        child: Container(
          margin: EdgeInsets.all(5),
          child: ValueListenableBuilder(
              valueListenable: widget.counter,
              builder: (BuildContext buildContext, int value, Widget child) {
                String image = 'images/3.png';
                if (value == 1) {
                  image = 'images/2.png';
                } else if (value == 2) {
                  image = 'images/1.png';
                }
                return AnimatedContainer(
                  duration: Duration(seconds: 3),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white)),
                  child: Image.asset(image, fit: BoxFit.fill),
                );
              }),
        ),
      ),
    );
  }
}
