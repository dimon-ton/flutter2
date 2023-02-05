import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todolist/pages/add.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:todolist/pages/update_todolist.dart';
import 'package:todolist/sqlitedb.dart';
import 'package:todolist/todo.dart';

class TodoList extends StatefulWidget {
  // const TodoList({ Key? key }) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todolistitem = [];

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
    // getTodolist();
    readTodoSQL();
    readTodo.status = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddPage()))
              .then((value) {
            setState(() {
              // getTodolist();
              readTodoSQL();
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
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ))
        ],
        title: Text('All Todolist'),
      ),
      body: todoListCreateSQL(),
    );
  }

  Widget todolistCreate() {
    return ListView.builder(
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
        });
  }

  Widget todoListCreateSQL() {
    return ListView.builder(
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
        });
  }

  Future<void> getTodolist() async {
    List alltodo = [];
    var url = Uri.https('chang-pimon.online', '/api/all-todolist');
    var response = await http.get(url);
    // var result = json.decode(response.body);
    var result = utf8.decode(response.bodyBytes);
    print(result);
    setState(() {
      todolistitem = jsonDecode(result);
    });
  }
}
