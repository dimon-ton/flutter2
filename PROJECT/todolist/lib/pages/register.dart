import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var user = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var lastname = TextEditingController();
  var tel = TextEditingController();

  String result = '-----------------------result-----------------------';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
              child: Text(
                'register page',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: user,
              decoration: InputDecoration(
                  hintText: 'กรุณาชื่อผู้ใช้/อีเมล์',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  hintText: 'กรุณากรอกพาสเวิร์ด', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                  hintText: 'กรุณากรอกชื่อ', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: lastname,
              decoration: InputDecoration(
                  hintText: 'กรุณากรอกนามสกุล', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: tel,
              decoration: InputDecoration(
                  hintText: 'กรุณากรอกเบอร์โทรศัพท์',
                  border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  postToRegister();

                  // setState(() {
                  //   user.clear();
                  //   password.clear();
                  //   name.clear();
                  //   lastname.clear();
                  //   tel_number.clear();
                  // });
                },
                child: Center(child: Text('Register'))),
            SizedBox(
              height: 30,
            ),
            Center(child: Text('${result}'))
          ],
        ),
      ),
    );
  }

  Future postToRegister() async {
    var url = Uri.http('192.168.1.88:8000', '/api/newuser');
    Map<String, String> header = {"Content-type": "application/json"};

    String v1 = '"username":"${user.text}"';
    String v2 = '"password":"${password.text}"';
    String v3 = '"first_name":"${name.text}"';
    String v4 = '"last_name":"${lastname.text}"';
    String v5 = '"mobile":"${tel.text}"';

    String jsondata = '{$v1,$v2,$v3,$v4,$v5}';

    var response = await http.post(url, headers: header, body: jsondata);

    print('---------------------result-----------------------');
    print(response.body);

    var byte_result = utf8.decode(response.bodyBytes);
    print(byte_result);

    setState(() {
      var result_json = jsonDecode(byte_result);

      String token = result_json['token'];
      setToken(token);

      String status = result_json['status'];

      if (status == 'user-created') {
        String setresult =
            'ยินดีด้วย คุณ${result_json['first_name']} ${result_json['last_name']} คุณได้สมัครสมาชิกเรียบร้อยแล้ว';

        result = setresult;
      } else if (status == 'user-exist') {
        result = 'มี user ในระบบแล้ว';
      } else {
        result = 'ข้อมูลไม่ถูกต้อง กรุณาตรวจสอบ';
      }
    });
  }

  Future<void> setToken(token) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }
}
