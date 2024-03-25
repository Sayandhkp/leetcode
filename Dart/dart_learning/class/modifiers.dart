import 'dart:developer';

/// Class modifier BASE
///
/// Enforce inheritance of class or mixins implementations
///
/// Dis allows implementations outside its own library
base class BaseMod {
  void testFunction() {
    log("TEST_FUNCTION");
  }
}

/// The type 'BaseEmil' must be 'base', 'final' or 'sealed' because the supertype 'BaseMod' is 'base'.
///
final class BaseEmil implements BaseMod {
  @override
  void testFunction() {
    // TODO: implement testFunction
  }
}

interface class Vehicle {}

/// Pure Interface + Abstract
///
/// Pure interface -> Can implement but can not extend out side defining library
/// Pure interface can have abstract functions
abstract interface class Animal {
  void canWalk();
}

///  close the type hierarchy, use the final modifier.
/// This prevents subtyping from a class outside of the current library.
/// Disallowing both inheritance and implementation prevents subtyping entirely.
///
///
final class Rectangle {
  void calculateArea() {
    log("Calculate");
  }
}

/// Same as final, But it will have exhaustive awareness, That is compiler can
/// identify all its subclasses(because as final all should be inside same class)
///
/// In switch statement, it will give compile time error of missing any subclass
sealed class Rectangle1 {}

class Square extends Rectangle1 with SquareProp {}

class Hexagon extends Rectangle1 {}

/// exhaustive awareness example
///
/// The type 'Rectangle1' is not exhaustively matched by the switch cases since
/// it doesn't match 'Hexagon()'.
/// Try adding a default case or cases that match 'Hexagon()'.
String getRect(Rectangle1 rectangle1) {
  switch (rectangle1) {
    case Square():
      return "SQUARE";

    default:
      return "";
  }
}

/// mixins
///
mixin SquareProp {
  final bool isSquare = true;
}
