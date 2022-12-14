import 'package:flutter/material.dart';
// ใช้คำสั่ง stf
class CalculatePage extends StatefulWidget {
  // const CalculatePage({ Key? key }) : super(key: key);

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  // ตำแน่งสำหรับเก็บข้อมูลของค่าที่ผู้ใช้กรอกเข้ามา
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  // double price = 10;
  TextEditingController result = TextEditingController();

  @override
  void initState() {
  // TODO: implement initState
    super.initState();

    result.text = 'ซื้อแอปเปิ้ลจำนวน - ผล ราคาผลละ - บาท รวมลูกค้าต้องจ่ายทั้งหมด - บาท';
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
                  controller: price,
                  decoration: InputDecoration(
                      labelText: 'กรุณาใส่ราคาแอบเปิ้ล',
                      border: OutlineInputBorder())),
              SizedBox(
                height: 15,
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
                    var cal = double.parse(quantity.text)*double.parse(price.text);
                    print('Apple Quantity: ${quantity.text} Total: $cal Baht');

                    setState(() {
                       result.text = 'ซื้อแอปเปิ้ลจำนวน ${quantity.text} ผล ราคาผลละ ${price.text} บาท รวมลูกค้าต้องจ่ายทั้งหมด $cal บาท';
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