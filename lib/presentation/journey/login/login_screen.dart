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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
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
            Text(
              'Email',
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                filled: true,
                fillColor: AppColors.white1,
                hintText: 'example@gmail.com',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Password',
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => TextField(
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  suffix: InkWell(
                    child: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onTap: () {
                      controller.isPasswordHidden.value =
                          !controller.isPasswordHidden.value;
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  filled: true,
                  fillColor: AppColors.white1,
                  hintText: 'Enter Your Password',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                //Checkbox(value: value, onChanged: onChanged)
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
