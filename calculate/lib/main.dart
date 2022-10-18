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
          Image.asset(
            'assets/images/pngwing.png',
            width: 300,
          ),
          Text('----------------------------------------------Picture----------------------------------------------'),
          SizedBox(height: 20,),
          Text(
            'โปรแกรมคำนวณ',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20,),
          TextField(
            decoration: InputDecoration(
                labelText: 'จำนวนแอพเปิ้ล', border: OutlineInputBorder()),
          ),
          SizedBox(height: 15,),
          Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ElevatedButton(
                child: Text('คำนวณ'),
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(50, 10, 50, 10)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 30))),
              )),
              Text('แอปเปิ้ลลูกละ 5 บาท 3 ลูก 15 บาท', style: TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
