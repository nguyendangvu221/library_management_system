import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/splash/splash_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Center(
        child: Text(
          'Library Management System',
          style: ThemeText.heading1.blue900.copyWith(color: AppColors.blue700),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
