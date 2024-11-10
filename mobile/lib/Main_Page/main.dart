import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_storage/Edit_Resume/Second_Edit_Page.dart';

import '../Edit_Resume/First_Edit_Page.dart';
import 'City_Button.dart';
import 'Search_String.dart';
import 'Sliver_List_Main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditFirstPage(title: "",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
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
                Search_String(),
                Padding(
                  padding: EdgeInsets.only(right: 80, top: 48),
                  child: Text(
                    "Самые популярные \n вакансии",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
          SliverListMain(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CupertinoColors.opaqueSeparator,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.image), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: ""),
        ],
      ),
    );
  }
}






