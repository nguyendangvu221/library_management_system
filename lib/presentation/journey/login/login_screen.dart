import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:library_management_system/presentation/widget/app_touchable.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child:Padding(
          padding: EdgeInsets.all(90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hi, Welcome Back!',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700

              ),),
            ]),
        ),),
      
      
    );
  }
}
