class _Private {
  int _number1 = 100;
  int _number2 = 200;

  void _private() => print('This is private method.');
}

class Public extends _Private {
  String text1 = 'one hundred';
  String text2 = 'two hundred';

  void public() => print('This is public method.');
}

class Private {
  int number1 = 300;
  int _number2 = 400;

  void public1() => print('First private method');
  void _private() => print('First private method.');

  int get number => _number2; // create object number
  set number(_number2) => number; // assign value to object number

  get toPublic => _private();
  set toPublic(_private) => toPublic;
}

void main() {
  var _private = _Private();
  print(_private._number1);
  print(_private._number2);
  _private._private();

  var public = Public();
  print('${public._number1} stands for ${public.text1}');
  print('${public._number2} stands for ${public.text2}');

  public._private();
  public.public();

  var private1 = Private();
  private1.toPublic;
}
