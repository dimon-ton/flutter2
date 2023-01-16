import 'private.dart';

class Public extends Private {
  String text1 = 'three hundred';
  String text2 = 'four hundred';

  void public2() => print('second publick method');
  void _private2() => print('second private method');
}

void main() {
  var public = Public();
  print(public.number1);
  print(public._number2);
  public._private();
  public.public1();
  public._private2();
}
