import 'package:design_flutter/widget/banner.dart';
import 'package:flutter/material.dart';
import 'package:design_flutter/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(
                            'assets/images/avatar.png',
                          ),
                          radius: 20,
                        ),
                        const SizedBox(width: 8),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chào mừng',
                              style: TextStyle(
                                color: AppColors.subTitle,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'SƠN, LÊ TRẦN BÁ',
                              style: TextStyle(
                                color: AppColors.title,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Stack(
                            children: [
                              const Icon(
                                Icons.notifications,
                                color: AppColors.title,
                              ),
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
                          icon: const Icon(
                            Icons.chat_bubble,
                            color: AppColors.title,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: SearchBar(),
              ),
              SizedBox(height: 10),
              BannerCarousel(),
              // CarouselView(
              //   itemExtent: MediaQuery.sizeOf(context).width - 0,
              //   itemSnapping: true,
              //   elevation: 5,
              //   children: List.generate(5, (index) {
              //     return Container(
              //       margin: const EdgeInsets.all(0),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         image: DecorationImage(
              //           image: AssetImage('assets/banners/banner.png'),
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.grey[300]!, Colors.grey[600]!],
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
