import 'dart:async';

import 'package:flutter/material.dart';

class FormUI extends StatefulWidget {
  const FormUI({Key? key}) : super(key: key);

  @override
  State<FormUI> createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  int _seletedIndex = 0;

  void _onItem(int index) {
    setState(() {
      _seletedIndex = index;
    });
  }

  String? _radioValue;

  List<String> menuList = ['menu1', 'menu2', 'menu3'];
  String? getText;

  Map<String, bool> language = {'Dart': true, 'Python': false};

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetBottom = [
      buildUI(),
      Text('Bottom tab 2'),
      Text('Bottom tab 3'),
      Text('Bottom tab 4'),
    ];

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          title: Text('User Form'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: 'Form',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Info',
              ),
              Tab(
                icon: Icon(Icons.person),
                text: 'Contact',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Column(
            //       children: [
            //         buildTextField(),
            //         buildRadio(),
            //         buildDropDown(),
            //         buildCheckBox(),
            //         buildButton(),
            //         buildListView()
            //       ],
            //     ),
            //   ),
            // ),
            Center(
              child: widgetBottom.elementAt(_seletedIndex),
            ),
            Center(
              child: Text('Tab2'),
            ),
            Center(
              child: Text('Tab3'),
            ),
          ],
        ),
        bottomNavigationBar: buildBottomNavbar(),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.blue,
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Menu 1'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Menu 2'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Menu 3'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavbar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
      ],
      currentIndex: _seletedIndex,
      onTap: _onItem,
      selectedItemColor: Colors.amber[400],
    );
  }

  Widget buildTextField() {
    return TextField(
      decoration:
          InputDecoration(border: OutlineInputBorder(), labelText: 'Password'),
    );
  }

  Widget buildRadio() {
    return Row(
      children: [
        Radio(
            value: 'ชาย',
            groupValue: _radioValue,
            onChanged: (String? value) {
              setState(() {
                _radioValue = value;
              });
            }),
        Text(
          'ชาย',
          style: TextStyle(fontSize: 16),
        ),
        Radio(
            value: 'หญิง',
            groupValue: _radioValue,
            onChanged: (String? value) {
              setState(() {
                _radioValue = value;
              });
            }),
        Text(
          'หญิง',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildDropDown() {
    return DropdownButton(
        hint: Text('Plese select'),
        value: getText,
        onChanged: (String? newValue) {
          setState(() {
            getText = newValue;
          });
        },
        items: menuList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList());
  }

  Widget buildCheckBox() {
    return Row(
      children: [
        Checkbox(
            value: language['Dart'],
            onChanged: (bool? value) {
              setState(() {
                language['Dart'] = value!;
              });
            }),
        Text(
          'Dart',
          style: TextStyle(fontSize: 16),
        ),
        Checkbox(
            value: language['Python'],
            onChanged: (bool? value) {
              setState(() {
                language['Python'] = value!;
              });
            }),
        Text(
          'Python',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget buildButton() {
    return ElevatedButton(
        onPressed: () {
          _showDialog();
        },
        child: Text('Submit'));
  }

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text('This is Alert Dialog.'), Text('กรุณากด OK')],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  Widget buildListView() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(8),
        children: [
          Container(
            height: 50,
            color: Colors.blue[400],
            child: Text('ListView 1'),
          ),
          Container(
            height: 50,
            color: Colors.blue[300],
            child: Text('ListView 2'),
          ),
          Container(
            height: 50,
            color: Colors.blue[200],
            child: Text('ListView 3'),
          ),
          Container(
            height: 50,
            color: Colors.blue[100],
            child: Text('ListView 4'),
          ),
        ],
      ),
    );
  }

  Widget buildUI() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTextField(),
            buildRadio(),
            buildDropDown(),
            buildCheckBox(),
            buildButton(),
            buildListView()
          ],
        ),
      ),
    );
  }
}
