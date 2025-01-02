import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Edit_Resume/Second_Edit_Page.dart';
import 'package:job_storage/Main_Page/main.dart';
import 'package:job_storage/Main_Page/values.dart';

import 'Field.dart';
import 'Progress_bar.dart';
import 'Resume.dart';

class EditFirstPage extends StatefulWidget {
  EditFirstPage({super.key, required this.resume});

  Resume resume;

  @override
  State<EditFirstPage> createState() => _EditFirstPageState(resume: resume);
}

class _EditFirstPageState extends State<EditFirstPage> {
  _EditFirstPageState({required this.resume});

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
                        onPressed: (){
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) =>
                                      MyHomePage(title: "")));
                        },
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
                    " Заполните основную \n информацию",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Создание резюме",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 146),
                      child: Column(
                        children: [
                          Field(
                            str: "Фамилия",
                            padding: 290,
                            type: "surname",
                            resume: resume,
                          ),
                          Field(
                            str: "Имя",
                            padding: 325,
                            type: "name",
                            resume: resume,
                          ),
                          Field(
                            str: "Номер телефона",
                            padding: 235,
                            type: "phone",
                            resume: resume,
                          ),
                          Field(
                            str: "Электронная почта",
                            padding: 216,
                            type: "mail",
                            resume: resume,
                          ),
                          Field(
                            str: "Гражданство",
                            padding: 265,
                            type: "cityzenship",
                            resume: resume,
                          ),
                          Field(
                            str: "Адрес",
                            padding: 300,
                            type: "adress",
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
              //Padding(padding: EdgeInsets.only(left: 88),child:Progress_bar(left: 0, right: 0,),),
              //Padding(padding: EdgeInsets.only(left: 83 * 2),child:Progress_bar(left: 0, right: 0,),),
              //Padding(padding: EdgeInsets.only(left: 83 * 3),child:Progress_bar(left: 0, right: 0,),),
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
                                  pageBuilder: (context, animation1, animation2) =>
                                      MyHomePage(title: "")));

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
                                   EditSecondPage(resume: resume,)));
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
