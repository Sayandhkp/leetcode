class Car {
  void handleRight() {
    print("Handle Right");
  }
}

class Hyundai extends Car {}

abstract class Dog {
  static const a = 0;
  void bark();
}

void main(List<String> args) {
  Hyundai().handleRight();
  B().bark();
}

class ADog implements Dog {
  @override
  void bark() {
    print("Dog bark");
  }
}

class B extends ADog {}
