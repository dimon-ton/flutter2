import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10,),
        Center(
          child: Text("Home Page", style: TextStyle(fontSize: 30),),
        ),
        SizedBox(height: 10,),
        Center(
          child: Text("Tutorial", style: TextStyle(fontSize: 25),),
        ),
        Padding(padding: EdgeInsets.fromLTRB(40, 10, 40, 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('1.ใส่ราคาแอปเปิ้ลลงในช่องกรอก ในช่อง "กรุณาใส่ราคาแอปเปิ้ล"', style: TextStyle(fontSize: 15)),
          Text('2.ใส่ราคาแอบเปิ้ลลงในช่องกรอก ในช่อง "กรุณาใส่ราคาแอปเปิ้ล"', style: TextStyle(fontSize: 15)),
          Text('3.คลิกปุ่มคำนวณเพื่อคำนวณราคาของแอปเปิ้ล ราคาของแอปเปิ้ลจะแสดงอยู่ด้านล่างปุ่มคำนวณ"', style: TextStyle(fontSize: 15)),
          SizedBox(height: 50,),
          Center(
            child: Image.asset('tutorial.png', width: 400,),
          )
        ],),)

      ],
    );
  }
}