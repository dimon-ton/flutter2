import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  // const ContactPage({ Key? key }) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 15,),
        Center(
          child: Text('ติดต่อเรา', style: TextStyle(fontSize: 30),),
        ),
        Padding(padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start ,children: [
          SizedBox(height: 15,),
          Center(child: 
            Image.asset('User-Executive-Green-icon.png')
          ,),
          SizedBox(height: 20,),
          Text('พัฒนาโดย Chang Pimon', style: TextStyle(fontSize: 20),),
          Text('Tel: 0891268598', style: TextStyle(fontSize: 20),),
          Text('email: Chang@mail.com', style: TextStyle(fontSize: 20),),
          Text('Website: www.chang.co.th', style: TextStyle(fontSize: 20),),
        ],),
        )
        

      ],
    );
  }
}