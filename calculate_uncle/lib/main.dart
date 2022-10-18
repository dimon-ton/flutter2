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
        appBar: AppBar(title: Text("แอพคำนวณ")),
        body: Home(),
    ));
  }
}

class Home extends StatefulWidget {
  // const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ตำแน่งสำหรับเก็บข้อมูลของค่าที่ผู้ใช้กรอกเข้ามา
  TextEditingController quantity = TextEditingController();
  double price = 10;
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    result.text = 'ซื้อแอปเปิ้ลจำนวน - ผล ราคาผลละ 10 บาท รวมลูกค้าต้องจ่ายทั้งหมด - บาท';
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(35),
          child: Center(
              child: Column(
            children: [
              Image.asset(
                'assets/apple.png',
                width: 300,
              ),
              Text(
                "โปรแกรมคำนวณ",
                style: TextStyle(fontSize: 30),
              ),
              TextField(
                  controller: quantity,
                  decoration: InputDecoration(
                      labelText: 'กรุณาใส่จำนวนแอบเปิ้ล',
                      border: OutlineInputBorder())),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    var cal = double.parse(quantity.text)*price;
                    print('Apple Quantity: ${quantity.text} Total: $cal Baht');

                    setState(() {
                       result.text = 'ซื้อแอปเปิ้ลจำนวน ${quantity.text} ผล ราคาผลละ 10 บาท รวมลูกค้าต้องจ่ายทั้งหมด $cal บาท';
                    });

                  },
                  child: Text('คำนวณ'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff6a2b8a)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.fromLTRB(50, 20, 50, 20)),
                      textStyle:
                          MaterialStateProperty.all(TextStyle(fontSize: 15)))),
              SizedBox(
                height: 15,
              ),
              Text(
                  result.text,
                  style: TextStyle(fontSize: 20))
            ],
          )),
        ),
      ],
    );
  }
}
