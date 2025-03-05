import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:design_flutter/core/constants.dart';
import 'package:design_flutter/views/document/document_view.dart';
import 'package:design_flutter/views/home/home_view.dart';
import 'package:design_flutter/views/profile/profile_view.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationMenu> {
  int _page = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const DocumentsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.primaryBlack,
        animationDuration: Duration(milliseconds: 300),
        color: Colors.black,
        buttonBackgroundColor: Colors.white,
        items: [
          Icon(Icons.home, color: AppColors.toyotaRed),
          Icon(Icons.description, color: AppColors.toyotaRed),
          Icon(Icons.account_circle, color: AppColors.toyotaRed),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),

      body: _pages[_page],
    );
  }
}
