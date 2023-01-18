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

  @override
  Widget build(BuildContext context) {
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
        body: Center(
          child: Column(
            children: [],
          ),
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
}
