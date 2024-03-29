import 'package:flutter/material.dart';
// http method request
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todolist/sqlitedb.dart';
import 'dart:async';

import 'package:todolist/todo.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  // announce variable
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();

  Todo addTodo = Todo(status: false);
  SqliteDatebase addSQL = SqliteDatebase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('เพิ่มรายการใหม่')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // ช่องกรอกข้อมูล title
            TextField(
              controller: todo_title,
              decoration: InputDecoration(
                  labelText: 'หัวข้อ', border: OutlineInputBorder()),
            ),
            SizedBox(height: 30),
            TextField(
              controller: todo_detail,
              decoration: InputDecoration(
                  labelText: 'รายละเอียด', border: OutlineInputBorder()),
              minLines: 4,
              maxLines: 8,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text('เพิ่มรายการ'),
                onPressed: () {
                  print('-----------------------');
                  print('title: ${todo_title.text}');
                  print('detail: ${todo_detail.text}');

                  postTodo();
                  // addTodoSQL();

                  setState(() {
                    todo_title.clear();
                    todo_detail.clear();
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(10, 20, 10, 20)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 30))),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future addTodoSQL() async {
    addTodo =
        Todo(title: todo_detail.text, detail: todo_detail.text, status: false);
    await addSQL.createTodo(addTodo);
  }

  // edit androidManifest.xml by input <uses-permission android:name="android.permission.INTERNET"/>
  Future postTodo() async {
    var url = Uri.http('192.168.1.97:8000', '/api/post-todolist');
    // var url = Uri.https('chang-pimon.online', '/api/post-todolist');
    Map<String, String> header = {"Content-type": "application/json"};
    String jsondata =
        '{"title":"${todo_title.text}", "detail":"${todo_detail.text}"}';
    var response = await http.post(url, headers: header, body: jsondata);
    print('------------------resutl------------------------');
    print(response.body);
  }
}
