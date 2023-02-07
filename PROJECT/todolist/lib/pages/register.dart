import 'dart:html';

import 'package:flutter/material.dart';

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
  var tel_number = TextEditingController();

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
              child: const Text(
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
              controller: tel_number,
              decoration: InputDecoration(
                  hintText: 'กรุณากรอกเบอร์โทรศัพท์',
                  border: OutlineInputBorder()),
            )
          ],
        ),
      ),
    );
  }
}
