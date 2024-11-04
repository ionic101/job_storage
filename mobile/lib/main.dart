import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
          SliverList.builder(
              itemCount: 5,
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
                                        right: 70,
                                      ),
                                      child: Text(
                                        "Заголовок заголовок",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      )),
                                  Icon(Icons.image)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 225, top: 13),
                                child: Text("30 000 - 50 000",
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
                                        EdgeInsets.only(right: 95, top: 28),
                                    child: Text("ООО Название компании",
                                        style: TextStyle(
                                            color: Color(0xFF444444),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 0, top: 28),
                                    child: Icon(Icons.image),
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 236, top: 13),
                                child: Text("Екатеринбург",
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
                  ))
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

class Search_String extends StatelessWidget {
  const Search_String({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 13, left: 35, right: 35),
      child: Container(
        width: double.infinity,
        height: 33,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              top: BorderSide(width: 1),
              bottom: BorderSide(width: 1),
              left: BorderSide(width: 1),
              right: BorderSide(width: 1),
            )),
        child: Padding(
          padding: EdgeInsets.only(top: 4, left: 10, bottom: 4),
          child: Row(
            children: [
              Text("Профессии"),
              Padding(
                padding: EdgeInsets.only(left: 200),
                child: Icon(Icons.search),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class City_Button extends StatelessWidget {
  const City_Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, left: 15),
      child: Row(
        children: [
          SizedBox(
            width: 165,
            height: 40,
            child: TextButton(
                onPressed: null,
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.placemark,
                      color: Color(0xFF3C3744),
                    ),
                    Text(
                      "Екатеринбург",
                      style: TextStyle(fontSize: 18, color: Color(0xFF3C3744)),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
