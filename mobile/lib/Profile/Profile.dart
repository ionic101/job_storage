import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_storage/Design/Images.dart';
import 'package:job_storage/Edit_Resume/Resume.dart';
import 'package:job_storage/Edit_Resume/Second_Edit_Page.dart';
import 'package:job_storage/Main_Page/HttpQuery.dart';
import 'package:job_storage/Main_Page/values.dart';
import 'package:job_storage/Profile/ListView_Profile.dart';

import '../Edit_Resume/First_Edit_Page.dart';
import '../Main_Page/City_Button.dart';
import '../Main_Page/Sliver_List_Main.dart';
import '../Main_Page/main.dart';

class Profile extends StatefulWidget {
  Profile({super.key, required this.title});

  final String title;

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  int _selectedIndex = 1;

  void _onItemTap(int index) {
    setState(() {
      switch (index) {
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
                      Profile(title: "")));
        case 3:
          print("profil");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xFF090C9B),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 240),
              child: IconButton(
                  onPressed: () {
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
            IconButton(
              color: Colors.white,
                onPressed: null,
                icon: SvgPicture.asset('assets/images/settings.svg'),
                )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.supervised_user_circle, size: 100)),
                  Text(
                    "User",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 200, left: 18, right: 278),
            child: Text(
              "Резюме",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 50),child: ListViewProfile(),)

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
