import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress_bar extends StatelessWidget {
  const Progress_bar({
    super.key,
    required this.left,
    required this.right,
  });

  final double right;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 71,
      decoration: BoxDecoration(
          color: Color(0xFFB4C5E4),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(left),
              topRight: Radius.circular(right))),
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    required this.str,
    required this.padding,
    super.key,
  });
  final String str;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 28),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: padding),
            child: Text(
              str,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            height: 33,
            width: 333,
            child: TextField(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border(
                top: BorderSide(width: 0.5),
                bottom: BorderSide(width: 0.5),
                left: BorderSide(width: 0.5),
                right: BorderSide(width: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}