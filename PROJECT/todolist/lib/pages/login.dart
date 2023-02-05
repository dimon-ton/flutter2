import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
                  if (username.text == 'admin') {
                    print("User: Admin");

                    setState(() {
                      username.text = 'admin';
                      result = 'Username: Admin';
                      // setUserName(username.text);
                      // setStatus('success');
                    });
                  } else {
                    print("User: Other");
                    setState(() {
                      // setUserName('---Other User---');
                      // setStatus('failed');
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
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => ViewPage()));
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
}
