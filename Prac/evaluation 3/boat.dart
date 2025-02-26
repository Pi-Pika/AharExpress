import 'vehicle.dart';
class Boat extends Vehicle {
  Boat(int speed) : super(speed);

  @override
  void move() {
    print("Boat is sailing.");
  }
}