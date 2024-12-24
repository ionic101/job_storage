import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Edit_Resume/First_Edit_Page.dart';
import 'package:job_storage/Edit_Resume/Third_Edit_Page.dart';
import 'package:job_storage/Main_Page/main.dart';
import 'package:job_storage/Main_Page/values.dart';

import 'Field.dart';
import 'Progress_bar.dart';
import 'Resume.dart';

class EditFivePage extends StatefulWidget {
  EditFivePage({super.key, required this.resume});

  Resume resume;

  @override
  State<EditFivePage> createState() => _EditFivePageState(resume: resume);
}

class _EditFivePageState extends State<EditFivePage> {
  _EditFivePageState({required this.resume});

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
                    " Дополнительные вопросы",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Field(
                            str:
                                "Ваше ключевое преимущество над\nдругими кандидатами",
                            padding: 80,
                            type: "quastion1",
                            resume: resume,
                          ),
                          Field(
                            str: "Почему вы интересуетесь этой\nдолжностью",
                            padding: 120,
                            type: "quastion2",
                            resume: resume,
                          ),
                          Field(
                            str: "Ваши карьерные цели ",
                            padding: 180,
                            type: "quastion3",
                            resume: resume,
                          ),
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
              Padding(
                padding: EdgeInsets.only(left: 83 * 4, right: 4),
                child: Progress_bar(
                  left: 0,
                  right: 8,
                ),
              ),
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
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    "Ваше резюме сохранено",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: TextButton(
                                    onPressed: () {
                                      listOfResumes.add(resume);
                                      Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                              pageBuilder: (context, animation1,
                                                      animation2) =>
                                                  MyApp()));
                                    },
                                    child: Text("Хорошо"),
                                  ),
                                );
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
