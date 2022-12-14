import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layout/pages/detail.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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
      child: FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
          // var data = json.decode(snapshot.data.toString());
          return ListView.builder(itemBuilder: (BuildContext context, int index) {
            return mybox(snapshot.data[index]['title'], snapshot.data[index]['subtitle'], snapshot.data[index]['img_url'], snapshot.data[index]['detail']);

          },
          itemCount: snapshot.data.length,);

        },
        future: getData(),
        // future: DefaultAssetBundle.of(context).loadString('assets/JSON/data.json'),
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
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      // color: Colors.lightBlue,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(title, style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
        Text(subtitle, style: TextStyle(fontSize: 15, color: Colors.white),),
        SizedBox(height: 10,),
        TextButton(onPressed: () {
          print('next page >>>');
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(v1, v2, v3, v4)));
        }, child:Text('อ่านต่อ', style: TextStyle(color: Colors.amberAccent),))
      ],),
    );
  }

  Future getData() async {
    // https://raw.githubusercontent.com/dimon-ton/BasicAPI/main/data.json
    var url = Uri.https('raw.githubusercontent.com','/dimon-ton/BasicAPI/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}