import 'dart:html';

import 'package:flutter/material.dart';
import 'package:loginpage/viewpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var username = TextEditingController();
  var password = TextEditingController();
  String result = '------result-------';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
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
                  if (username.text == 'admin') {
                    print("User: Admin");

                    setState(() {
                      username.text = 'admin';
                      result = 'Username: Admin';
                      setUserName(username.text);
                      setStatus('success');
                    });
                  } else {
                    print("User: Other");
                    setState(() {
                      setUserName('---Other User---');
                      setStatus('failed');
                      result = 'Login failed';
                    });
                  }
                },
                child: Text('login')),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewPage()));
                },
                child: Text('View Username')),
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

  Future<void> setUserName(textUsername) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('username', textUsername);
  }

  Future<void> setStatus(textStatus) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString('status', textStatus);
  }
}
