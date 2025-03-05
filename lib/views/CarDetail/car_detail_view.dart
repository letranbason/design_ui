import 'package:design_flutter/blocs/car/car_bloc.dart';
import 'package:design_flutter/core/constants.dart';
import 'package:design_flutter/models/entities/car_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({required this.car, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      car.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      context.read<CarListBloc>().add(ToggleFavorite(car));
                    },
                  ),
                ],
              ),
              Center(
                child: Image.asset(
                  car.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 100,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Tên xe
              Text(
                car.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.title,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'This is the detail page for ${car.name}. Add more details here!',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
