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

void main() {
  var uncle01 = Uncle();
  print(uncle01.runtimeType);

  print(uncle01.fullname);
  print(uncle01.job = 'engineer');
  print(uncle01.age = 50);
  print(uncle01.money);
  print(uncle01.isSingle ? 'single' : 'married' );
  
}