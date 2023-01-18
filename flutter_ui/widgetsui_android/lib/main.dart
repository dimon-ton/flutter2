import 'package:flutter/material.dart';
import 'package:widgetsui_android/form.dart';

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildImage(),
            SizedBox(
              height: 20,
            ),
            buildText(),
            SizedBox(
              height: 20,
            ),
            buildTextField(),
            SizedBox(
              height: 20,
            ),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Image.asset('assets/profile.png');
  }

  Widget buildText() {
    return Text('fill password');
  }

  Widget buildTextField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
    );
  }

  Widget buildButton() {
    return ElevatedButton(
      onPressed: () {
        if (passwordController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please fill the password!'),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {},
            ),
          ));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => FormUI()));
        }
      },
      child: Text('Submit'),
    );
  }
}
