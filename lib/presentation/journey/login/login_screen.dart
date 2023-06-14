import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text('Hi, Welcome Back!',
                      textAlign: TextAlign.left,
                      style: ThemeText.bodyStrong.s24.blue700),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  'Code',
                  style: ThemeText.bodyMedium.s14.blue700,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Form(
                  key: controller.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 312.h,
                        height: 80.w,
                        child: TextFormField(
                          controller: controller.codeController,
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
                            hintText: 'example: CT1234',
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
                      Text(
                        'Password',
                        textAlign: TextAlign.left,
                        style: ThemeText.bodyMedium.s14.blue700,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Obx(
                        () => SizedBox(
                          width: 312.h,
                          height: 80.w,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return 'Mật khẩu > 6 kí tự';
                              }
                              return null;
                            },
                            controller: controller.passwordController,
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Password',
                              hintStyle: ThemeText.bodyMedium.s14.blue700,
                              suffixIcon: IconButton(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 12),
                                icon: controller.isPasswordHidden.value
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off),
                                onPressed: () {
                                  controller.isPasswordHidden.value =
                                      !controller.isPasswordHidden.value;
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
                    ],
                  ),
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Obx(
                //       () => Checkbox(
                //         value: controller.ischeck.value,
                //         checkColor: AppColors.white1,
                //         shape: const RoundedRectangleBorder(
                //             borderRadius: BorderRadius.all(Radius.circular(1))),
                //         onChanged: (value) {
                //           controller.ischeck.value = !controller.ischeck.value;
                //         },
                //       ),
                //     ),
                //     Text(
                //       'Remember Me',
                //       textAlign: TextAlign.left,
                //       style: ThemeText.bodyMedium.copyWith(fontSize: 13.sp),
                //     ),
                //     const SizedBox(
                //       width: 20,
                //     ),
                //     TextButton(
                //         onPressed: () {},
                //         child: Text(
                //           'Forget Password?',
                //           textAlign: TextAlign.right,
                //           style: ThemeText.bodySemibold.copyWith(
                //             color: Colors.red,
                //             fontSize: 12.sp,
                //           ),
                //         )),
                //   ],
                // ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 312.w,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.bluef,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      'Login',
                      style: ThemeText.bodySemibold.s16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                // Row(
                //   children: [
                //     const Expanded(
                //       child: Divider(
                //         color: AppColors.blue700,
                //         thickness: 1,
                //       ),
                //     ),
                //     SizedBox(
                //         width: 70.h,
                //         child: Text(
                //           'Or With',
                //           style: ThemeText.bodyMedium.s14.blue700,
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
                // const SizedBox(
                //   height: 50,
                // ),
                // SizedBox(
                //   width: 312.w,
                //   height: 48.h,
                //   child: OutlinedButton(
                //     onPressed: () {},
                //     style: OutlinedButton.styleFrom(
                //       backgroundColor: AppColors.white,

                //       side: BorderSide(color: AppColors.blue700), //<-- SEE HERE
                //     ),
                //     child: Text(
                //       'Login with Barcode',
                //       style: ThemeText.bodySemibold.s14.blue700,
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
                      style: ThemeText.bodyMedium.s14
                          .copyWith(color: Colors.black87),
                    ),
                    TextButton(
                        onPressed: () => Get.offAllNamed(AppRoutes.register),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: ThemeText.bodySemibold.s14.blue700,
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
}
