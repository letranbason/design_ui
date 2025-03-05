import 'package:design_flutter/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 3),
            color: AppColors.primaryBlack,
          ),

          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 80),
                Center(
                  child:
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/icons/icon_avatar.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ).animate().fade(duration: 700.ms).scale(),
                ),

                SizedBox(height: 20),

                // Elegant Name Text
                Text(
                  "Son Le",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "DancingScript",
                  ),
                ).animate().fade(duration: 600.ms).slideY(begin: -0.3),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified, color: Colors.blueAccent, size: 24),
                    SizedBox(width: 5),
                    Text(
                      "Thành viên",
                      style: TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ).animate().fade(duration: 500.ms).scale(),

                SizedBox(height: 30),

                GlassCard().animate().fade(duration: 700.ms).slideY(begin: 0.3),

                SizedBox(height: 30),

                Center(
                  child:
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/car3.png',
                          fit: BoxFit.cover,
                        ),
                      ).animate().fade(duration: 700.ms).scale(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  const GlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withOpacity(0.1),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 3),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Xe: CAMRY 2.0Q",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Biển số: SON-9999",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Thành viên từ : March 2025",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
