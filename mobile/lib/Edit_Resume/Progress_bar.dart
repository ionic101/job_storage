import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Main_Page/values.dart';

import 'Resume.dart';

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
