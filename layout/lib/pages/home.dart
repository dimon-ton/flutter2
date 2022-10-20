import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ความรู้เกี่ยวกับคอมพิวเตอร์'),),
      body: Padding(padding: EdgeInsets.all(20),
      child: FutureBuilder(builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          return ListView.builder(itemBuilder: (BuildContext context, int index) {
            return mybox(data[index]['title'], data[index]['subtitle'], data[index]['img_url'], data[index]['detail']);

          },
          itemCount: data.length,);

        },
        future: DefaultAssetBundle.of(context).loadString('assets/JSON/data.json'),
        ),),
    );
  }

  Widget mybox(String title, String subtitle, String _imageurl, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = _imageurl;
    v4 = detail;
    return Container(
      margin: EdgeInsets.only(top: 20),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(v1, v2, v3, v4)));
        }, child:Text('อ่านต่อ', style: TextStyle(color: Colors.amberAccent),))
      ],),
    );
  }


}