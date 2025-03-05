import 'package:design_flutter/core/constants.dart';
import 'package:flutter/material.dart';

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
