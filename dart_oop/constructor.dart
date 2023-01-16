class Uncle {
  String fullname = 'ลุงวิศวกร';
  String? job;
  late int age;
  double? money;
  bool isSingle = true;

  void learn() {
    print("I'm learning dart language.");
  }

  Uncle(
      {required this.fullname,
      this.job,
      required this.age,
      this.money,
      required this.isSingle}) {
    this.fullname = fullname;
    this.job = job;
    this.age = age;
    this.money = money;
    this.isSingle = isSingle;
  }
}

// กำหนดค่าในรอบเดียวจบ
void main() {
  //  var uncle02 = Uncle('somchai', 'security', 70, 1000000, false);

  // print(uncle02.fullname);
  // print(uncle02.job);
  // print(uncle02.age);
  // print(uncle02.money);
  // print(uncle02.isSingle);

  var uncle03 = Uncle(fullname: 'somjai', age: 45, isSingle: true);
  print(uncle03.fullname);
  print(uncle03.job);
  print(uncle03.age);
  print(uncle03.money);
  print(uncle03.isSingle);

  uncle03.learn();
}
