class Uncle {
  String fullname = 'ลุงวิศวกร';
  String? job;
  late int age;
  double? money;
  bool isSingle = true;


  void learn() {
    print("I'm learning dart language.");
  }
}


// กำหนดค่าในรอบเดียวจบ
void main() {
  var uncle01 = Uncle()
  ..fullname
  ..job = 'engineer'
  ..age = 50
  ..money = 50000
  ..isSingle = true
  ..learn();

  // print(uncle01.runtimeType);


  print(uncle01.job);
  // print(uncle01.fullname);
  // print(uncle01.job = 'engineer');
  // print(uncle01.age = 50);
  // print(uncle01.money);
  // print(uncle01.isSingle ? 'single' : 'married' );
  
}