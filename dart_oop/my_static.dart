class First {
  String fullname = 'loong somchai';
  static String language = 'Dart';

  static void calculate () {
    print("I'm calculating...");
  }

  void teach() {
    print("$fullname can teach $language language!");
  }
}



void main() {
  // static
  print(First.language);
  First.calculate();

  // non-static

  var first = First();
  first.teach();

}