import 'package:flutter/material.dart';

// http method request
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class UpdatePage extends StatefulWidget {
  final v1, v2, v3;
  const UpdatePage(this.v1, this.v2, this.v3);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  var _v1, _v2, _v3;

    // announce variable
  TextEditingController todo_title = TextEditingController();
  TextEditingController todo_detail = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1; //id
    _v2 = widget.v2; //title
    _v3 = widget.v3; //detail

  
    todo_title.text = _v2;
    todo_detail.text = _v3;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แก้ไข'),
        actions: [
          IconButton(onPressed: (() {
            print("delete ID: $_v1");
            deleteTodo();
            Navigator.pop(context, 'delete');

          }), icon: Icon(Icons.delete, color: Colors.red,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // ช่องกรอกข้อมูล title
            TextField(
              controller: todo_title,
              decoration: InputDecoration(
                  labelText: 'หัวข้อ', 
                  border: OutlineInputBorder()
                  ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: todo_detail,
              decoration: InputDecoration(
                labelText: 'รายละเอียด',
                border: OutlineInputBorder()
              ),
              minLines: 4,
              maxLines: 8,
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                    child: Text('แก้ไข'),
                    onPressed: () {
                      print('-----------------------');
                      print('title: ${todo_title.text}');
                      print('detail: ${todo_detail.text}');

                      updateTodo();
                      Navigator.pop(context, 'edited');

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

  // edit androidManifest.xml by input <uses-permission android:name="android.permission.INTERNET"/>
  Future updateTodo() async {
    var url = Uri.http('192.168.66.1:8000','/api/update-todolist/$_v1');
    //  var url = Uri.http('192.168.1.89:8000','/api/post-todolist');
    Map<String, String> header = {"Content-type":"application/json"};
    String jsondata = '{"title":"${todo_title.text}", "detail":"${todo_detail.text}"}';
    var response = await http.put(url, headers: header, body: jsondata);
    print('------------------resutl------------------------');
    print(response.body);
  }

  Future deleteTodo() async {
    var url = Uri.http('192.168.66.1:8000','/api/delete-todolist/$_v1');
    //  var url = Uri.http('192.168.1.89:8000','/api/post-todolist');
    Map<String, String> header = {"Content-type":"application/json"};
   var response = await http.delete(url, headers: header);
    print('------------------resutl------------------------');
    print(response.body);
  }

}