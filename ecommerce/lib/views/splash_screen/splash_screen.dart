import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/views/authentication_screen/login.dart';
import 'package:ecommerce/views/home_screen/home.dart';
import 'package:ecommerce/widgets_common/app_logo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // Ensure Flutter Material is imported

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    super.initState(); // super should be called first
    changeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(logo, width: 300),
            const SizedBox(height: 20), // Use SizedBox instead of heightBox if necessary
          ],
        ),
      ),
    );
  }
}
