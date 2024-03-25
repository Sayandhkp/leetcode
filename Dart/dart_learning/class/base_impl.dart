import 'modifiers.dart';

/// The class 'BaseMod' can't be implemented outside of its library because it's a base class.
///
// sealed class BaseImpl implements BaseMod {}

/// The type 'BaseExt' must be 'base', 'final' or 'sealed' because the supertype 'BaseMod' is 'base'.
sealed class BaseExt extends BaseMod {}

/// Interface
///
///
/// The class 'Vehicle' can't be extended outside of its library because it's an interface class.
// class Car extends Vehicle{

// }

/// Can implement the interface class
class Car implements Vehicle {}


/// interface abstract classes
