
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Main_Page/values.dart';

import 'Resume.dart';

class Field extends StatefulWidget {
  Field({
    required this.str,
    required this.padding,
    required this.type,
    required this.resume,
    super.key,
  });

  final String str;
  final double padding;
  final String type;
  Resume resume;

  @override
  State<Field> createState() => _Field(str: str,padding: padding,type: type,resume: resume);
// TODO: implement createState
}


class _Field extends State<Field> {
  _Field({
    required this.str,
    required this.padding,
    required this.type,
    required this.resume
  });

  final String str;
  final double padding;
  final String type;

  Resume resume;




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
            child: TextField(
              onChanged: (value) {
                setState(() {
                  switch (type){
                    case "surname":
                      resume.surname = value;
                    case "name":
                      resume.name = value;
                    case "phone":
                      resume.phone = value;
                    case "citizen":
                      resume.citizen = value;
                    case "adress":
                      resume.adress = value;
                    case "name_univer":
                      resume.name_univer = value;
                    case "year_end":
                      resume.year_end = value;
                    case "education":
                      resume.education = value;
                    case "company":
                      resume.company = value;
                    case "post":
                      resume.post = value;
                    case "duties":
                      resume.duties = value;
                    case "expirience":
                      resume.expirience = value;
                    case "desired_post":
                      resume.desired_post = value;
                    case "desired_salary":
                      resume.desired_salary = value;
                    case "education":
                      resume.education = value;
                    case "education":
                      resume.education = value;
                    case "quastion1":
                      resume.quastion1 = value;
                    case "quastion2":
                      resume.quastion2 = value;
                    case "quastion3":
                      resume.quastion3 = value;
                  }

                });

              },
            ),
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