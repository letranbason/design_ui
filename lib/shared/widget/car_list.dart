import 'package:design_flutter/blocs/car/car_bloc.dart';
import 'package:design_flutter/blocs/car/car_event.dart';
import 'package:design_flutter/blocs/car/car_state.dart';
import 'package:design_flutter/views/CarDetail/car_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarList extends StatelessWidget {
  const CarList({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocBuilder<CarListBloc, CarListState>(
      builder: (context, state) {
        if (state is CarListInitial) {
          context.read<CarListBloc>().add(FetchCarList());
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is CarListLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is CarListLoaded) {
          final cars = state.cars;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 20,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final car = cars[index];
              return GestureDetector(
                onTap: () {
                  context.read<CarListBloc>().add(SelectCar(car));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailScreen(car: car),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          car.imagePath,
                          fit: BoxFit.scaleDown,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: Colors.red);
                          },
                        ),
                      ),
                      Text(
                        car.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }, childCount: cars.length),
          );
        }
        if (state is CarListError) {
          return SliverToBoxAdapter(child: Center(child: Text(state.message)));
        }
        if (state is CarSelected) {
          context.read<CarListBloc>().add(FetchCarList());
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(child: Text('Có lỗi khi tải dữ liệu')),
        );
      },
    );
  }
}
