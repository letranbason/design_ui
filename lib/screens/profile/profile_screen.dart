import 'package:flutter/material.dart';
import 'package:design_flutter/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        body: Center(child: Text('Profile Screen')),
      ),
    );
  }
}
