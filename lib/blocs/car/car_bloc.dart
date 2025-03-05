import 'package:design_flutter/blocs/car/car_event.dart';
import 'package:design_flutter/blocs/car/car_state.dart';
import 'package:design_flutter/models/entities/car_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListBloc extends Bloc<CarListEvent, CarListState> {
  CarListBloc() : super(CarListInitial()) {
    on<FetchCarList>((event, emit) async {
      emit(CarListLoading());
      try {
        await Future.delayed(const Duration(seconds: 1));
        final cars = [
          Car(name: "Raize", imagePath: "assets/images/car1.png"),
          Car(name: "Fortuner", imagePath: "assets/images/car2.png"),
          Car(name: "Wigo", imagePath: "assets/images/car3.png"),
          Car(name: "Yaris Cross", imagePath: "assets/images/car4.png"),
          Car(name: "Vios", imagePath: "assets/images/car5.png"),
          Car(name: "Camry", imagePath: "assets/images/car6.png"),
        ];
        emit(CarListLoaded(cars));
      } catch (e) {
        emit(CarListError('Failed to load cars: $e'));
      }
    });

    on<SelectCar>((event, emit) {
      emit(CarSelected(event.car));
    });

    on<ToggleFavorite>((event, emit) {
      if (state is CarListLoaded) {
        final currentState = state as CarListLoaded;
        final updatedCars =
            currentState.cars.map((car) {
              if (car == event.car) {
                return Car(
                  name: car.name,
                  imagePath: car.imagePath,
                  isFavorite: !car.isFavorite,
                );
              }
              return car;
            }).toList();
        emit(CarListLoaded(updatedCars));
      }
    });
  }
}

class ToggleFavorite extends CarListEvent {
  final Car car;

  ToggleFavorite(this.car);
}
