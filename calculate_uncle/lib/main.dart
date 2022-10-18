import 'package:calculate/pages/calc.dart';
import 'package:calculate/pages/contact.dart';
import 'package:calculate/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ใช้คำสั่ง stl
class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  // const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [HomePage(), CalculatePage(), ContactPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("แอพคำนวณ")),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, //หน้าปัจจุบันที่เลือก
          items: [
            // หน้าแต่ละหน้าทีอะไรบ้าง
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าแรก"),
            BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "คำนวณ"),
            BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "ติดต่อเรา"),
          ],
          onTap: (index) {
            setState(() {
              print(index);
              _currentIndex = index;
            });
          }),
    );
  }
}
