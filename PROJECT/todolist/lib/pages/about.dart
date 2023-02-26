import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: const [
            Text('เกี่ยวกับแอพ Todolist'),
            Text('แอพนี้เป็นแอพเกี่ยวกับการบันทึกสิ่งที่ต้องทำประจำวัน'),
          ],
        ),
      ),
    );
  }
}
