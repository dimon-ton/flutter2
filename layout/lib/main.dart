import 'package:flutter/material.dart';
import 'package:layout/pages/about.dart';
import 'package:layout/pages/calculate.dart';
import 'package:layout/pages/detail.dart';
import 'package:layout/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Computer Knowledge",
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  // const Main({ Key? key }) : super(key: key);
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.book_online), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calculate'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About')
      ],
      onTap: (index) {
        setState(() {
          print(index);
          _currentIndex = index;
        });
      },
      ),
    );
  }
}