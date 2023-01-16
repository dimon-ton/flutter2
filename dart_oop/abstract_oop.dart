abstract class Geometry {
  late double base;
  late double height;

  double calArea(); // calculate for area
}

// triangle area
class Triangle implements Geometry {
  double base;
  double height;

  Triangle({required this.base, required this.height});

  @override
  double calArea() => 0.5 * base * height;
}

// Parrallel Area
class Parallel implements Geometry {
  double base;
  double height;

  Parallel({required this.base, required this.height});

  @override
  double calArea() => 0.5 * base * height;
}

// Rhombus Area
class Rhombus implements Geometry {
  double base;
  double height;

  Rhombus({required this.base, required this.height});

  @override
  double calArea() => 0.5 * base * height;
}

void main() {
  var tri = Triangle(base: 10, height: 6);
  print(tri.calArea());

  var pa = Parallel(base: 10, height: 7);
  print(pa.calArea());

  var rhom = Rhombus(base: 10, height: 8);
  print(rhom.calArea());
}
