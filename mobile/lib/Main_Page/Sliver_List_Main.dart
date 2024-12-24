import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Main_Page/main.dart';


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



class SliverListMain extends StatelessWidget {
  const SliverListMain({
    super.key,
  });




  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: MyHomePage(title: '').count() ,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: 333,
            height: 311,
            margin: EdgeInsets.only(top: 50),
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
                              name[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            )),
                        //Icon(Icons.image)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 225, top: 13),
                      child: Text(salary[index],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 250, top: 13),
                      child: Text("Заголовок",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 240, top: 13),
                        child: Container(
                          height: 20,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFFB4C5E4)),
                          child: Text("Заголовок",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        )),
                    Row(
                      children: [
                        Padding(
                            padding:
                            EdgeInsets.only(right: 10, top: 13),
                            child: Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(2),
                                  color: Color(0xFFB4C5E4)),
                              child: Text("Заголовок",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            )),
                        Padding(
                            padding:
                            EdgeInsets.only(right: 146, top: 13),
                            child: Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(2),
                                  color: Color(0xFF3C3744)),
                              child: Text("Заголовок",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                          EdgeInsets.only(right: 0, top: 28),
                          child: Text(company[index],
                              style: TextStyle(
                                  color: Color(0xFF444444),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400)),
                        ),
                        //Padding(
                        //  padding: EdgeInsets.only(right: 0, top: 28),
                        //  child: Icon(Icons.image),
                        //)
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 200, top: 13),
                      child: Text(city[index],
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 13, top: 15),
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
                              child: Text("Откликнуться",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
                            ))),
                  ],
                )),
          ),
        ));
  }
}