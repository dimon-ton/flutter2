import 'my_static.dart';

class Second {}


void main() {
  // static
  print(First.language);
  First.calculate();

  // non-static

    var first = First();
    print(first.fullname);
    first.teach();
}