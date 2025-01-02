import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Main_Page/main.dart';

class Search_String extends StatefulWidget {
  const Search_String({
    super.key,
  });

  State<StatefulWidget> createState() => _Search_String();

}

class _Search_String extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13, left: 35, right: 35),
      child:SizedBox(
        width:double.infinity ,
        height: 33,
        child: TextField(
          onChanged: (value) {
            setState(() {
              String string = value.toLowerCase();
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
          ) ,

        ),
      )
    );
  }
}



