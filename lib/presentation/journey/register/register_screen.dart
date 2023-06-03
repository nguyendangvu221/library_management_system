import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:sign_in_button/sign_in_button.dart';

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
                  child: Text(
                    'Create an account',
                    style: TextStyle(
                      color: AppColors.blue700,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Connect with your friends today!',
                    style: TextStyle(
                      color: AppColors.blue700,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: Form(
                    key: controller.loginFormKey1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.usernameController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                color: AppColors.blue700,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: AppColors.white1,
                            hintText: 'Enter Your Username',
                            hintStyle: TextStyle(
                              color: AppColors.blue700,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tên không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.emailController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                color: AppColors.blue700,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: AppColors.white1,
                            hintText: 'Enter Your Email',
                            hintStyle: TextStyle(
                              color: AppColors.blue700,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Emai không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.phonenumberController1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: new BorderSide(
                                color: AppColors.blue700,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            filled: true,
                            fillColor: AppColors.white1,
                            hintText: 'Enter Your Phone Number',
                            hintStyle: TextStyle(
                              color: AppColors.blue700,
                              fontSize: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Số điện thoại không hợp lệ';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => TextFormField(
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
                              hintStyle: TextStyle(
                                  color: AppColors.blue700, fontSize: 16),
                              suffixIcon: IconButton(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 12),
                                icon: controller.isPasswordHidden1.value
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  controller.isPasswordHidden1.value =
                                      !controller.isPasswordHidden1.value;
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: AppColors.blue700,
                                ),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              filled: true,
                              fillColor: AppColors.white1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                    child: Text('Sign Up',style: TextStyle(fontSize: 16),),
                  ),
                ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                  color: AppColors.blue700, thickness: 1),
                            ),
                            SizedBox(
                                width: 70.h,
                                child: Text(
                                  'Or With',
                                  style: TextStyle(
                                      color: AppColors.blue700, fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                              child: Divider(
                                color: AppColors.blue700,
                                thickness: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 312.w,
                          height: 48.h,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.white,

                              side: BorderSide(
                                  color: AppColors.blue700), //<-- SEE HERE
                            ),
                            child: Text(
                              'Login with Barcode',
                              style: TextStyle(
                                  color: AppColors.blue700, fontSize: 16),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                            TextButton(
                                onPressed: () =>
                                    Get.put(const RegisterScreen()),
                                child: Text(
                                  'Login up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      ],
                    ),
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
