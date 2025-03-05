import 'package:design_flutter/models/entities/car_model.dart';

abstract class CarListState {}

class CarListInitial extends CarListState {}

class CarListLoading extends CarListState {}

class CarListLoaded extends CarListState {
  final List<Car> cars;

  CarListLoaded(this.cars);
}

class CarListError extends CarListState {
  final String message;

  CarListError(this.message);
}

class CarSelected extends CarListState {
  final Car car;

  CarSelected(this.car);
}
