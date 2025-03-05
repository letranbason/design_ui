import 'package:flutter/material.dart';
import 'package:design_flutter/constants.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryBlack,
        body: Center(child: Text('Document Screen')),
      ),
    );
  }
}
