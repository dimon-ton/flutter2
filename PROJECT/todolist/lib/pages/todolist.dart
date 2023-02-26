import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/pages/about.dart';
import 'package:todolist/pages/add.dart';

import 'package:http/http.dart' as http;
import 'package:todolist/pages/login.dart';
import 'dart:async';
import 'dart:convert';

import 'package:todolist/pages/update_todolist.dart';
import 'package:todolist/sqlitedb.dart';
import 'package:todolist/todo.dart';

import 'package:url_launcher/url_launcher.dart';

class TodoList extends StatefulWidget {
  // const TodoList({ Key? key }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todolistitem = [];
  String msg = '';
  String fullname = '';

  // SQL
  List<Todo> todoList = [];
  Todo readTodo = Todo(status: false);
  SqliteDatebase readSQL = SqliteDatebase();

  readTodoSQL() async {
    List<Todo> allList = await readSQL.readTodo();
    setState(() {
      todoList = allList;
    });
  }

  @override
  void initState() {
    super.initState();
    getTodolist();
    // readTodoSQL();
    // readTodo.status = false;
    check(); // check if the username existed.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()))
              .then((value) {
            setState(() {
              getTodolist();
              // readTodoSQL();
            });
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                setState(() {
                  getTodolist();
                });
              }),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
        title: const Text('All Todolist'),
      ),
      body: Column(
        children: [
          const Text(
            'รายการสิ่งที่ต้องทำ',
            style: TextStyle(color: Colors.green, fontSize: 20),
          ),
          todolistCreate()
        ],
      ),
    );
  }

  Widget todolistCreate() {
    return Expanded(
      child: ListView.builder(
          itemCount: todolistitem.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: Text("${todolistitem[index]['title']}"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => UpdatePage(
                            todolistitem[index]['id'],
                            todolistitem[index]['title'],
                            todolistitem[index]['detail'])))).then((value) {
                  setState(() {
                    print('check: $value');
                    if (value == 'delete') {
                      final snackBar = SnackBar(
                        content: const Text('ลบรายการเรียบร้อยแล้ว'),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (value == 'edited') {
                      final snackBar = SnackBar(
                        content: const Text('แก้ไขรายการเรียบร้อยแล้ว'),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    getTodolist();
                  });
                });
              },
            ));
          }),
    );
  }

  Widget todoListCreateSQL() {
    return Expanded(
      child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            int todoID = todoList[index].id!;
            String todoTitle = todoList[index].title!;
            String todoDetail = todoList[index].detail!;

            return Card(
                child: ListTile(
              leading: Checkbox(
                value: todoList[index].status,
                onChanged: (bool? value) {
                  setState(() {
                    todoList[index].status = value!;
                  });
                },
              ),
              title: Text(todoTitle),
              onTap: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                UpdatePage(todoID, todoTitle, todoDetail))))
                    .then((value) {
                  setState(() {
                    print('check: $value');
                    if (value == 'delete') {
                      final snackBar = SnackBar(
                        content: const Text('ลบรายการเรียบร้อยแล้ว'),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (value == 'edited') {
                      final snackBar = SnackBar(
                        content: const Text('แก้ไขรายการเรียบร้อยแล้ว'),
                      );

                      // Find the ScaffoldMessenger in the widget tree
                      // and use it to show a SnackBar.
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    // getTodolist();
                    readTodoSQL();
                  });
                });
              },
              enabled: todoList[index].status == false,
            ));
          }),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('สวัสดีคุณ $fullname'), accountEmail: null),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('About'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              _launchUrl();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              logout(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> getTodolist() async {
    List alltodo = [];
    var url = Uri.http('192.168.1.97:8000', '/api/all-todolist');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitem = jsonDecode(result);
    });
  }

  void getFullname() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var first_name = pref.getString('first_name');
    var last_name = pref.getString('last_name');
    msg = 'สวัสดีคุณ ${first_name} ${last_name}';

    fullname = '$first_name $last_name';
  }

  void check() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final checkvalue = pref.get('first_name') ?? 0;

    if (checkvalue != 0) {
      getFullname();
    }
  }

  Future<void> _launchUrl() async {
    var url = Uri.parse('https://www.uncle-engineer.com/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
