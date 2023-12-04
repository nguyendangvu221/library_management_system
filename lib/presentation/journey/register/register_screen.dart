import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Create an account',
                  style: AppTheme.heading2.copyWith(color: AppColor.blue.shade700, fontSize: 24.sp),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Expand your knowledge every day!',
                  style: AppTheme.textM.copyWith(
                    color: AppColor.blue.shade700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              _customTextInput(
                text: 'Họ tên',
                textInput: Obx(
                  () => CustomTextInput(
                    errorText: controller.errorName.value,
                    isDisable: false,
                    controller: controller.nameController,
                    fillColor: AppColor.white,
                  ),
                ),
              ),
              _customTextInput(
                text: 'Email',
                textInput: Obx(
                  () => CustomTextInput(
                    errorText: controller.errorEmail.value,
                    controller: controller.emailController,
                    isDisable: false,
                    fillColor: AppColor.white,
                  ),
                ),
              ),
              _customTextInput(
                text: 'Password',
                textInput: Obx(
                  () => CustomTextInput(
                    errorText: controller.errorPassword.value,
                    controller: controller.passwordController,
                    isDisable: false,
                    fillColor: AppColor.white,
                    obscureText: controller.isPasswordHidden.value,
                    seffixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(end: 12),
                      icon: !controller.isPasswordHidden.value
                          ? Icon(
                              Icons.visibility,
                              color: AppColor.blue.shade700,
                            )
                          : Icon(Icons.visibility_off, color: AppColor.blue.shade700),
                      onPressed: () {
                        controller.isPasswordHidden.value = !controller.isPasswordHidden.value;
                      },
                    ),
                  ),
                ),
              ),
              _customTextInput(
                text: 'Confirm Password',
                textInput: Obx(
                  () => CustomTextInput(
                    errorText: controller.errorConfirmPassword.value,
                    controller: controller.confirmPasswordController,
                    isDisable: false,
                    fillColor: AppColor.white,
                    obscureText: controller.isConfirmPasswordHidden.value,
                    seffixIcon: IconButton(
                      padding: const EdgeInsetsDirectional.only(end: 12),
                      icon: !controller.isConfirmPasswordHidden.value
                          ? Icon(
                              Icons.visibility,
                              color: AppColor.blue.shade700,
                            )
                          : Icon(Icons.visibility_off, color: AppColor.blue.shade700),
                      onPressed: () {
                        controller.isConfirmPasswordHidden.value = !controller.isConfirmPasswordHidden.value;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomDefaultButton(
                isDisable: false,
                backgroundColor: AppColor.blue,
                isDisplayIcon: false,
                textButton: 'Continue',
                onPressed: () {
                  controller.onRegister1();
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      textAlign: TextAlign.center,
                      style: AppTheme.text.copyWith(
                        color: AppColor.black,
                        fontSize: 14.sp,
                      )),
                  TextButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.login),
                    child: Text(
                      'Login up',
                      textAlign: TextAlign.center,
                      style: AppTheme.textMBold.copyWith(
                        color: AppColor.blue.shade700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextInput({
    required String text,
    required Widget textInput,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTheme.textMReg.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        textInput,
      ],
    );
  }
}
