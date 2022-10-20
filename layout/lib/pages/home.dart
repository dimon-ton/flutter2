import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> subtitle = [
    "คอมพิวเตอร์คือ อุปกรณ์ที่ใช้สำหรับการคำนวณและทำงานอื่น ๆ",
    "บทความนี้จะเริ่มต้นการเขียนโปรแกรม",
    "Tools สำหรับการออกแบบ UI ของ Google"
  ];
  List<String> img = [
    'https://cdn.pixabay.com/photo/2015/12/04/14/05/code-1076536_960_720.jpg',
    'https://cdn.pixabay.com/photo/2016/11/18/13/03/apple-1834328_960_720.jpg',
    'https://miro.medium.com/max/1200/1*AkuZzTEw-WYMRzu8fIobOg.png'


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ความรู้เกี่ยวกับคอมพิวเตอร์'),),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          mybox('คอมพิวเตอร์คืออะไร?', subtitle[0], img[1]),
          SizedBox(height: 20,),
          mybox('มาเขียนโปรแกรมกัน', subtitle[1], img[0]),
          SizedBox(height: 20,),
          mybox('Flutter คือ ?', subtitle[2], img[2]),
        ],
      ),
    );
  }

  Widget mybox(String title, String subtitle, String _imageurl) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.lightBlue,
        image: DecorationImage(
          image: NetworkImage(_imageurl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.50), BlendMode.darken)
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.5),
          offset: Offset(6, 6),
          blurRadius: 3,
          spreadRadius: 0,
        )]
      ),
      padding: EdgeInsets.all(20),
      // color: Colors.lightBlue,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
        Text(subtitle, style: TextStyle(fontSize: 15, color: Colors.white),),
        SizedBox(height: 18,),
        TextButton(onPressed: () {
          print('next page >>>');
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
        }, child:Text('อ่านต่อ', style: TextStyle(color: Colors.amberAccent),))
      ],),
    );
  }


}