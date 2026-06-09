
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Splash_Screen/controller/splashcontroller.dart';
import 'package:get/get.dart';

class Splashscreen extends GetView<SplashController> {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF7C6FFF), Color(0xFFFF6FCF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7C6FFF).withOpacity(0.5),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: const Icon(
                Icons.checklist_rounded,
                color: Colors.white,
                size: 44,
              ),
            ),

            const SizedBox(height: 24),

            // App name
            const Text(
              'TodoApp',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: -1.2,
              ),
            ),

            const SizedBox(height: 10),

            // Subtitle
            Text(
              'Stay organized. Stay focused.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white.withOpacity(0.4),
              ),
            ),

            const SizedBox(height: 48),

            // Loading indicator
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: const Color(0xFF7C6FFF).withOpacity(0.7),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white.withOpacity(0.25),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}