import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/pages/register.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:todolist/pages/todolist.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  String result = '------result-------';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login to Todolist")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: ListView(
          children: [
            Text('Login Page'),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: username,
              decoration: InputDecoration(hintText: 'Username'),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  login();
                  // if (username.text == 'admin') {
                  //   print("User: Admin");

                  //   setState(() {
                  //     username.text = 'admin';
                  //     result = 'Username: Admin';
                  //     // setUserName(username.text);
                  //     // setStatus('success');
                  //   });
                  // } else {
                  //   print("User: Other");
                  //   setState(() {
                  //     // setUserName('---Other User---');
                  //     // setStatus('failed');
                  //     result = 'Login failed';
                  //   });
                  // }
                },
                child: Text('login')),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text('Register')),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                result,
                style: TextStyle(color: Colors.green, fontSize: 25),
              ),
            )
          ],
        )),
      ),
    );
  }

  Future login() async {
    var url = Uri.http('192.168.1.88:8000', '/api/authenticate');
    Map<String, String> header = {"Content-type": "application/json"};

    String v1 = '"username":"${username.text}"';
    String v2 = '"password":"${password.text}"';

    String jsondata = '{$v1,$v2}';

    var response = await http.post(url, headers: header, body: jsondata);

    print('---------------------result-----------------------');
    print(response.body);

    var byte_result = utf8.decode(response.bodyBytes);
    print(byte_result);

    var result_json = jsonDecode(byte_result);
    String status = result_json['status'];

    if (status == 'login-success') {
      String username = result_json['username'];
      String token = result_json['token'];
      setToken(token);
      setUserInfo(result_json['first_name'], result_json['last_name'],
          result_json['username']);

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => TodoList()));
    } else if (status == 'login-failed') {
      result = 'เข้าสู่ระบบไม่สำเร็จ';
    } else {
      result = 'กรุณากรอกอีกครั้ง';
    }
  }

  Future<void> setToken(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }

  Future<void> setUserInfo(fname, lname, usr) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('first_name', fname);
    pref.setString('last_name', lname);
    pref.setString('username', usr);
  }
}
