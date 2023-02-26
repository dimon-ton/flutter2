import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/pages/add.dart';
import 'package:todolist/pages/login.dart';
import 'package:todolist/pages/register.dart';

import 'package:todolist/pages/todolist.dart';

var token; // สำหรับเก็บตัว token ไว้

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  token = pref.getString('token');
  print(token);

  runApp(MaterialApp(
    home: token == null ? MyApp() : TodoList(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todolist",
      home: LoginPage(),
    );
  }
}
