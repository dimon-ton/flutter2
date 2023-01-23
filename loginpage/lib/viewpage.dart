import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  String? text = '';
  String? status = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserName();
    getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Username'),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Username:  ${text!}",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Center(
              child: Text(
                "Status:  ${status!}",
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  void getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      text = pref.getString('username');
    });
  }

  void getStatus() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    setState(() {
      status = pref.getString('status');
    });
  }
}
