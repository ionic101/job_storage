import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_storage/Main_Page/main.dart';
import 'package:job_storage/Main_Page/values.dart';


final List<String> name = [
  "Python-разработчик",
  "Разработчик C# Junior",
  "Стажер-разработчик бэкенда",
  "Разработчик баз данных ...",
  "Программист 1С",

];

final List<String> salary = [
  "60000 - 100000",
  "Неизвестно",
  "Неизвестно",
  "Неизвестно",
  "Неизвестно",
  "59000",
];

final List<String> city = [
  "Екатеринбург",
  "Екатеринбург",
  "Екатеринбург",
  "Екатеринбург",
  "Екатеринбург",
  "Екатеринбург",

];

final List<String> company = [
  "Теропром",
  "Альтек Проектирование",
  "Яндекс ",
  "Центр финансовых технологий",
  "Екром",
  "ИП Зотов Дмитрий Олегович",


];



class ListViewProfile extends StatelessWidget {
  const ListViewProfile({
    super.key,
  });




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listOfResumes.length,
      itemBuilder: (context, index) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 200),
        child: Card(
          color: Color(0xFFFFFFFF),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              width: 333,
              height: 311,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border(
                    top: BorderSide(width: 0.8),
                    bottom: BorderSide(width: 0.8),
                    left: BorderSide(width: 0.8),
                    right: BorderSide(width: 0.8),
                  )),
              child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 13),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                right: 0,
                              ),
                              child: Text(
                                listOfResumes[index].desired_post,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              )),
                          //Icon(Icons.image)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 225, top: 13),
                        child: Text(listOfResumes[index].desired_salary,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 180, top: 13),
                        child: Text("Опуликовано сегодня",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 13, top: 15),
                          child: TextButton(
                              onPressed: () {  },
                              child: Container(
                                  width: 302,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xFF3D52D5),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 9, horizontal: 95),
                                      child: Text("Посмотреть",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),)
                                  ))),
                          ),
                    ],
                  )),
            ),
          ),
        ),
      )


    );
  }
}