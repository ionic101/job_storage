import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Edit_Resume/First_Edit_Page.dart';
import 'package:job_storage/Edit_Resume/Five_Edit_Page.dart';
import 'package:job_storage/Edit_Resume/Third_Edit_Page.dart';

import 'Field.dart';
import 'Progress_bar.dart';
import 'Resume.dart';

class EditFourthPage extends StatefulWidget {
  EditFourthPage({super.key, required this.resume});

  Resume resume;

  @override
  State<EditFourthPage> createState() => _EditFourthPageState(resume: resume);
}

class _EditFourthPageState extends State<EditFourthPage> {
  _EditFourthPageState({required this.resume});

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
                    "Навыки",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Field(
                            str: "Технические навыки",
                            padding: 200,
                            type: "name_univer",
                            resume: resume,
                          ),
                          Field(
                            str: "Soft skills",
                            padding: 280,
                            type: "year_end",
                            resume: resume,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 28),
                            child: Text(
                              "Какой уровень владения инностранными\nязыками",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    resume.eng_skill = "A1";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: 33,
                                    width: 44,
                                    child: Text(
                                      "A1",
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    resume.eng_skill = "A2";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: 33,
                                    width: 44,
                                    child: Text(
                                      "A2",
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    resume.eng_skill = "B1";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: 33,
                                    width: 44,
                                    child: Text(
                                      "B1",
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    resume.eng_skill = "B2";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: 33,
                                    width: 44,
                                    child: Text(
                                      "B2",
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    resume.eng_skill = "C1";
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(top: 5),
                                    height: 33,
                                    width: 44,
                                    child: Text(
                                      "C1",
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                          //Field(str: "Какая у вас квалификация", padding: 162,),
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
              Padding(
                padding: EdgeInsets.only(left: 88),
                child: Progress_bar(
                  left: 0,
                  right: 0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 83 * 2),
                child: Progress_bar(
                  left: 0,
                  right: 0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 83 * 3),
                child: Progress_bar(
                  left: 0,
                  right: 0,
                ),
              ),
              //Padding(padding: EdgeInsets.only(left: 83 * 4,right: 4),child:Progress_bar(left: 0, right: 8,),),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 22, left: 16),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          EditFirstPage(resume: resume)));
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
                          setState(() {
                            Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            EditFivePage(
                                              resume: resume,
                                            )));
                          });
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
