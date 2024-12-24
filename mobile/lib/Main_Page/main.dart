import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_storage/Design/Images.dart';
import 'package:job_storage/Edit_Resume/Resume.dart';
import 'package:job_storage/Edit_Resume/Second_Edit_Page.dart';
import 'package:job_storage/Main_Page/HttpQuery.dart';
import 'package:job_storage/Main_Page/values.dart';
import 'package:job_storage/Profile/Profile.dart';

import '../Edit_Resume/First_Edit_Page.dart';
import 'City_Button.dart';
import 'Search_String.dart';
import 'Sliver_List_Main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: "",)
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  String Method(int index, List<String> name) {
    if (tr.length > 0) {
      name = [];
      return tr[index];
    }
    return name[index];
  }

  int count() {
    if (tr.length > 0) {
      return tr.length;
    }
    return name.length;
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 1;

  void _onItemTap(int index) {
    setState(() {
      switch(index){
        case 0:
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      EditFirstPage(resume: Resume())));
        case 1:
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    MyHomePage(title: "")));
        case 2:
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) =>
                      Profile(title: "")));


      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Color(0xFF090C9B),
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 240),
                  child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.image,
                        color: Colors.white,
                      )),
                ),
                TextButton(
                    onPressed: null,
                    child: Text(
                      "Войти",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                City_Button(),
                Padding(
                    padding: EdgeInsets.only(top: 13, left: 35, right: 35),
                    child: SizedBox(
                      width: double.infinity,
                      height: 33,
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            for (var char in name) {
                              if (char
                                  .toLowerCase()
                                  .contains(value.toLowerCase())) {
                                tr.add(char);
                              }
                            }

                            string = value.toLowerCase();
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(right: 80, top: 48),
                  child: Text(
                    "Самые популярные\nвакансии",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          SliverListMain()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF7F7F7),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/resume.svg'),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/vacancies.svg'),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/profil.svg'),
            label: "",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
