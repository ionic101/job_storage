import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_String extends StatelessWidget {
  const Search_String({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13, left: 35, right: 35),
      child: Container(
        width: double.infinity,
        height: 33,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              top: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1),
            )),
        child: Padding(
          padding: EdgeInsets.only(top: 4, left: 10, bottom: 4),
          child: Row(
            children: [
              Text("Профессии"),
              Padding(
                padding: EdgeInsets.only(left: 200),
                child: Icon(Icons.search),
              )
            ],
          ),
        ),
      ),
    );
  }
}