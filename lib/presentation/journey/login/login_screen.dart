import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  'Hi, Welcome Back!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              const Text(
                'Email',
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11.r),
                    borderSide: const BorderSide(
                      color: Color(
                        0x00000000,
                      ),
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(
                      color: Color(
                        0x00000000,
                      ),
                      width: 0,
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFFFFFF),
                  hintText: 'example@gmail.com',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
