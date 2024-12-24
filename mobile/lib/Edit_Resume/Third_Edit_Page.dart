import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Edit_Resume/Fourth_Edit_Page.dart';
import 'package:job_storage/Edit_Resume/Second_Edit_Page.dart';
import 'package:job_storage/Main_Page/values.dart';

import 'Field.dart';
import 'Progress_bar.dart';
import 'Resume.dart';

class EditThirdPage extends StatefulWidget {
  EditThirdPage({super.key, required this.resume});

  Resume resume;

  @override
  State<EditThirdPage> createState() => _EditThirdPageState(resume: resume);
}

class _EditThirdPageState extends State<EditThirdPage> {
  _EditThirdPageState({required this.resume});

  Resume resume;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Color(0xFF090C9B),
              title: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 300),
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 29, top: 25),
                  child: Stack(
                    children: [
                      Text(
                        " Опыт работы",
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [
                              Field(
                                str: "Где работали?",
                                padding: 250,
                                type: "company",
                                resume: resume,
                              ),
                              Field(
                                str: "Должности, на которых работали",
                                padding: 110,
                                type: "post",
                                resume: resume,
                              ),
                              Field(
                                str: "Какие были основные обязанности",
                                padding: 100,
                                type: "duties",
                                resume: resume,
                              ),
                              Field(
                                str: "Опыт работы",
                                padding: 260,
                                type: "expirience",
                                resume: resume,
                              ),
                              Field(
                                str: "Желаемая должность",
                                padding: 200,
                                type: "desired_post",
                                resume: resume,
                              ),
                              Field(
                                str: "Желаемаея зарплата",
                                padding: 200,
                                type: "desired_salary",
                                resume: resume,
                              ),
                              Field(
                                str: "Желаемый режим работы",
                                padding: 160,
                                type: "oper_mode",
                                resume: resume,
                              ),
                            ],
                          )),
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          color: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4),
                child: Progress_bar(
                  left: 8,
                  right: 0,
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 88),child:Progress_bar(left: 0, right: 0,),),
              Padding(padding: EdgeInsets.only(left: 83 * 2),child:Progress_bar(left: 0, right: 0,),),
              //Padding(padding: EdgeInsets.only(left: 83 * 3),child:Progress_bar(left: 0, right: 0,),),
              //Padding(padding: EdgeInsets.only(left: 83 * 4,right: 4),child:Progress_bar(left: 0, right: 8,),),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 22, left: 16),
                    child: TextButton(
                        onPressed: () {

                        },
                        child: Container(
                          width: 163,
                          height: 35,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              "Вернуться",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF3D52D5),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 22, right: 0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) =>
                                      EditFourthPage(resume: resume,)));
                          print(resume.surname);
                        },
                        child: Container(
                          width: 163,
                          height: 45,
                          child: Text(
                            "Сохранить \n и продолжить",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF3D52D5),
                              borderRadius:
                              BorderRadius.all(Radius.circular(8))),
                        )),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
