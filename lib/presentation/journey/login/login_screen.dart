import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import '../../../common/constants/app_routes.dart';

//import 'package:get/get.dart';
class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

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
                height: 70.h,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Hi, Welcome Back!',
                  textAlign: TextAlign.left,
                  style: AppTheme.heading2.copyWith(
                    color: AppColor.blue.shade700,
                    fontSize: 24.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _customTextInput(
                  text: 'Email',
                  textInput: Obx(
                    () => CustomTextInput(
                      errorText: controller.errorEmail.value,
                      isDisable: false,
                      controller: controller.emailController,
                      fillColor: AppColor.white,
                    ),
                  ),
                ),
                _customTextInput(
                  text: 'Password',
                  textInput: Obx(
                    () => CustomTextInput(
                      obscureText: controller.isPasswordHidden.value,
                      errorText: controller.errorPassword.value,
                      isDisable: false,
                      controller: controller.passwordController,
                      fillColor: AppColor.white,
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
                const SizedBox(
                  height: 70,
                ),
                CustomDefaultButton(
                  textButton: 'Login',
                  onPressed: () => controller.onLogin(),
                  backgroundColor: AppColor.blue.shade700,
                ),
                SizedBox(
                  height: 50.h,
                ),
                // Row(
                //   children: [
                //     const Expanded(
                //       child: Divider(
                //         color: AppColor.blue.shade700,
                //         thickness: 1,
                //       ),
                //     ),
                //     SizedBox(
                //         width: 70.h,
                //         child: Text(
                //           'Or With',
                //           style: AppTheme.textM.copyWith(
                // color: AppColor.blue.shade700,
                // fontSize: 14.sp,
                // ),
                //           textAlign: TextAlign.center,
                //         )),
                //     const Expanded(
                //       child: Divider(
                //         color: AppColor.blue.shade700,
                //         thickness: 1,
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 50,
                // ),
                // SizedBox(
                //   width: 312.w,
                //   height: 48.h,
                //   child: OutlinedButton(
                //     onPressed: () {},
                //     style: OutlinedButton.styleFrom(
                //       backgroundColor: AppColor.white,

                //       side: BorderSide(color: AppColor.blue.shade700), //<-- SEE HERE
                //     ),
                //     child: Text(
                //       'Login with Barcode',
                //       style: ThemeText.bodySemibold.s14.blue.shade700,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 30.h,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      textAlign: TextAlign.center,
                      style: AppTheme.textM.copyWith(
                        color: AppColor.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextButton(
                        onPressed: () => Get.offAllNamed(AppRoutes.register),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: AppTheme.textM.copyWith(
                            color: AppColor.blue.shade700,
                            fontSize: 14.sp,
                          ),
                        )),
                  ],
                ),
              ]),
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
