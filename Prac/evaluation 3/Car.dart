import 'vehicle.dart';
class Car extends Vehicle {
  Car(int speed) : super(speed);

  @override
  void move() {
    print("Car is driving.");
  }
}