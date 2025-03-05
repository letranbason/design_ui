import 'package:design_flutter/models/entities/car_model.dart';

abstract class CarListEvent {}

class FetchCarList extends CarListEvent {}

class SelectCar extends CarListEvent {
  final Car car;

  SelectCar(this.car);
}
