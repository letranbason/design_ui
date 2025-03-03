import 'package:flutter/material.dart';
import 'dart:async';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  late Timer _timer;
  int _currentPage = 0;

  final Duration _autoPlayDuration = const Duration(seconds: 3);
  static const int _bannerCount = 5;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction:
          0.9, // Adjust this value to show partial next/prev items
      initialPage: _currentPage,
    );

    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(_autoPlayDuration, (timer) {
      _currentPage = (_currentPage + 1) % _bannerCount;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _bannerCount,
        itemBuilder: (context, index) {
          final List<String> banners = [
            'assets/banners/banner.png',
            'assets/banners/banner2.png',
          ];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(banners[index % banners.length]),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
