// void main() => print('hello world');

void main() {
  print('hello world');
  String _myName = 'Chang Pimon';
  var age = 120;
  int money = 1000; // in USD
  int calculate = money * 33;
  double grade = 2.3;
  var calculate_grade = grade * 10;
  bool isFlutter = true;

  if (isFlutter == false) {
    print('I am a Flutter Programmer.');
  }
  print(calculate_grade);
  print(calculate);
  print(age);
  print(_myName);
  print('I have money: $money baht');
  print('I have money in USD: ${money*33}');

  String fname = 'Chang';
  String lname = 'Pimon';

  String full_name = fname + lname;
  String full_name2 = "Pimon" " " "Tungratog";
  String full_name3 = "$fname $lname";

  print(full_name3);
  print(full_name2);
  print(full_name);
  print('count characters of $fname: ${fname.length}');

  String? company;

  print(company);
  String wallet = '500';
  print('uncle engineer money: ' + money.toString());
  print(int.parse(wallet) + 1000);
  print(double.parse(wallet) + 1000);

  var friends = ['a', 'b', 'c'];

  print(friends[0]);

  List<String> myfriends = ['a', 'b', 'z'];

  myfriends.add('d');
  print(myfriends[3]);

}