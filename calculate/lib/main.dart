import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('แอพคำนวณ'),
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  //const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/pngwing.png', width: 300,),
          Text('-------Picture--------'),
          Text('โปรแกรมคำนวณ', style: TextStyle(fontSize: 30),),
          TextField(
            decoration: InputDecoration(
                labelText: 'จำนวนแอพเปิ้ล', 
                border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }
}
