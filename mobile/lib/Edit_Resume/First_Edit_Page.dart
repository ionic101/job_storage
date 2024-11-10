import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Edit_Resume/Second_Edit_Page.dart';

import 'Progress_bar.dart';

class EditFirstPage extends StatefulWidget {
  const EditFirstPage({super.key, required this.title});

  final String title;

  @override
  State<EditFirstPage> createState() => _EditFirstPageState();
}

class _EditFirstPageState extends State<EditFirstPage> {
  void _incrementCounter() {
    setState(() {});
  }

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
                    " Заполните основную \n информацию",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "Резюме “Грузчик-наборщик”",
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
                          ),
                          Field(
                            str: "Имя",
                            padding: 325,
                          ),
                          Field(
                            str: "Номер телефона",
                            padding: 235,
                          ),
                          Field(
                            str: "Электронная почта",
                            padding: 216,
                          ),
                          Field(
                            str: "Адрес",
                            padding: 310,
                          ),
                          Field(
                            str: "Дата Рождения",
                            padding: 245,
                          ),
                          Field(
                            str: "Гражданство",
                            padding: 255,
                          ),
                          Field(
                            str: "Ссылка на Github",
                            padding: 230,
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
                                  const EditSecondPage(title: "")));
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
