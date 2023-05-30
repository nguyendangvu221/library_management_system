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
                    style: ThemeText.heading2.blue700,
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'Connect with your friends today!',
                    style: ThemeText.bodyMedium.blue700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.loginFormKey1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: controller.usernameController1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          filled: true,
                          fillColor: AppColors.white1,
                          hintText: 'Enter Your Username',
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
                              borderRadius: BorderRadius.circular(12.r)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          filled: true,
                          fillColor: AppColors.white1,
                          hintText: 'Enter Your Email',
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
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          filled: true,
                          fillColor: AppColors.white1,
                          hintText: 'Enter Your Phone Number',
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            suffixIcon: IconButton(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 12),
                              icon: controller.isPasswordHidden1.value
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: () {
                                controller.isPasswordHidden1.value =
                                    !controller.isPasswordHidden1.value;
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
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
                        width: 312,
                        height: 48,
                        color: AppColors.bluef,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluef,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: controller.login1,
                          child: Text(
                            'Sign up',
                            style: ThemeText.bodySemibold.s15.bianca,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'Or With',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Divider(
                        color: AppColors.black,
                        height: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 312,
                        height: 48,
                        child: SignInButtonBuilder(
                          text: 'Login with facebook',
                          icon: Icons.facebook,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () {},
                          backgroundColor: AppColors.bluel,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 312,
                        height: 48,
                        child: SignInButton(
                          Buttons.google,
                          text: "Login with Google",
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? ",
                              textAlign: TextAlign.center),
                          TextButton(
                            onPressed: () => Get.put(const RegisterScreen()),
                            child: Text(
                              'Login up',
                              textAlign: TextAlign.center,
                            ),
                          ),
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
