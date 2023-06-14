import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text('Create an account',
                      style: ThemeText.bodyStrong.s24.blue700),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Connect with your friends today!',
                    style: ThemeText.bodySemibold.s16.blue700,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: controller.loginFormKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 312.h,
                        height: 80.w,
                        child: TextFormField(
                          controller: controller.usernameController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.blue700,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: AppColors.white1,
                            hintText: 'Enter Your Code',
                            hintStyle: ThemeText.bodyMedium.s14.blue700,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mã sinh viên không hợp lệ';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 312.h,
                        height: 80.w,
                        child: TextFormField(
                          controller: controller.emailController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.blue700,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: AppColors.white1,
                            hintText: 'Enter Your Email',
                            hintStyle: ThemeText.bodyMedium.s14.blue700,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Emai không hợp lệ';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 312.h,
                        height: 80.w,
                        child: TextFormField(
                          controller: controller.nameController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: AppColors.blue700,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: AppColors.white1,
                            hintText: 'Enter Your Name',
                            hintStyle: ThemeText.bodyMedium.s14.blue700,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tên không hợp lệ';
                            }
                            return null;
                          },
                        ),
                      ),
                      Obx(
                        () => SizedBox(
                          width: 312.h,
                          height: 80.w,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return 'Mật khẩu > 6 kí tự';
                              }
                              return null;
                            },
                            controller: controller.passwordController1,
                            obscureText: controller.isPasswordHidden1.value,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              hintStyle: ThemeText.bodyMedium.s14.blue700,
                              suffixIcon: IconButton(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 12),
                                icon: controller.isPasswordHidden1.value
                                    ? const Icon(
                                        Icons.visibility,
                                        color: AppColors.blue700,
                                      )
                                    : const Icon(Icons.visibility_off,
                                        color: AppColors.blue700),
                                onPressed: () {
                                  controller.isPasswordHidden1.value =
                                      !controller.isPasswordHidden1.value;
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.blue700,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              filled: true,
                              fillColor: AppColors.white1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 312.w,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: controller.login1,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluef,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: ThemeText.bodySemibold.s16
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 30.h,
                      // ),
                      // Row(
                      //   children: [
                      //     const Expanded(
                      //       child:
                      //           Divider(color: AppColors.blue700, thickness: 1),
                      //     ),
                      //     SizedBox(
                      //         width: 70.h,
                      //         child: Text(
                      //           'Or With',
                      //           style: ThemeText.bodyRegular.s16.blue700,
                      //           textAlign: TextAlign.center,
                      //         )),
                      //     const Expanded(
                      //       child: Divider(
                      //         color: AppColors.blue700,
                      //         thickness: 1,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 30.h,
                      ),
                      // SizedBox(
                      //   width: 312.w,
                      //   height: 48.h,
                      //   child: OutlinedButton(
                      //     onPressed: () {},
                      //     style: OutlinedButton.styleFrom(
                      //       backgroundColor: AppColors.white,

                      //       side: const BorderSide(
                      //           color: AppColors.blue700), //<-- SEE HERE
                      //     ),
                      //     child: Text('Login with Barcode',
                      //         style: ThemeText.bodySemibold.s16.blue700),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 30.h,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            textAlign: TextAlign.center,
                            style: ThemeText.bodyMedium.s14
                                .copyWith(color: Colors.black),
                          ),
                          TextButton(
                              onPressed: () => Get.offAllNamed(AppRoutes.login),
                              child: Text(
                                'Login up',
                                textAlign: TextAlign.center,
                                style: ThemeText.bodySemibold.s14.blue700,
                              )),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
