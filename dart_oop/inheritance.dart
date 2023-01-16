class Programer {
  String? language;
  Programer(this.language);

  void calculate() {
    print("I can create app by flutter.");
  }

  void teach() {
    print("I teach create app by flutter.");
  }

  void design() {
    print("I can design my program");
  }
}

class Engineer extends Programer {
  @override
  String? fullname;

  String? field;
  double? salary;

  Engineer({this.fullname, this.field, this.salary, String? language})
      : super(language);

  @override
  void design() {
    super.design();
    print("I design my project.");
  }
}

void main() {
  var engineer = Engineer(
      fullname: 'Pimon', field: 'construction engineer', salary: 60000);

  print(engineer.fullname);
  print(engineer.field);
  print(engineer.salary);
  engineer.calculate();
  engineer.teach();
  // engineer.design();

  var engineer2 = Engineer(language: 'Python');
  print(engineer2.language);
  // engineer2.design();

  var engineer3 = Engineer();
  engineer3.design();
}
