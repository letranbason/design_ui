import 'package:design_flutter/blocs/car/car_bloc.dart';
import 'package:design_flutter/blocs/car/car_event.dart';
import 'package:design_flutter/core/constants.dart';
import 'package:design_flutter/shared/widget/car_list.dart';
import 'package:design_flutter/shared/widget/search_bar.dart';
import 'package:design_flutter/shared/widget/text_animation.dart';
import 'package:design_flutter/shared/widget/banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: AppColors.primaryBlack,
              pinned: true,
              expandedHeight: 80.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage(
                        'assets/images/avatar.png',
                      ),
                      radius: 15,
                    ),
                    const SizedBox(width: 8),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chào mừng',
                          style: TextStyle(
                            color: AppColors.subTitle,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'SƠN, LÊ TRẦN BÁ',
                          style: TextStyle(
                            color: AppColors.title,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: Stack(
                    children: [
                      const Icon(Icons.notifications, color: AppColors.title),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 10,
                            minHeight: 10,
                          ),
                          child: const Text(
                            '1',
                            style: TextStyle(
                              color: AppColors.title,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.chat_bubble, color: AppColors.title),
                  onPressed: () {},
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: SearchBarWidget(),
                ),
                const SizedBox(height: 10),
                BannerCarousel(),
                const SizedBox(height: 10),
                MovingGradientText(),
                const SizedBox(height: 20),
              ]),
            ),
            BlocProvider(
              create: (context) => CarListBloc()..add(FetchCarList()),
              child: const CarList(),
            ),
          ],
        ),
      ),
    );
  }
}
