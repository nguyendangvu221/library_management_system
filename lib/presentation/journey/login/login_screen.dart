import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../register/register_screen.dart';

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
                  height: 30,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Form(
                    key: controller.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.emailController,
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
                        Text(
                          'Password',
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => TextFormField(
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
                              suffixIcon: IconButton(
                                padding:
                                    const EdgeInsetsDirectional.only(end: 12),
                                icon: controller.isPasswordHidden.value
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.ischeck.value,
                        checkColor: AppColors.white1,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(1))),
                        onChanged: (value) {
                          controller.ischeck.value = !controller.ischeck.value;
                        },
                      ),
                    ),
                    Text('Remember Me', textAlign: TextAlign.left),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          textAlign: TextAlign.right,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
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
                    child: Text('Login'),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Or With',
                      textAlign: TextAlign.center,
                    )),
                Divider(
                  color: AppColors.black,
                  height: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 312.w,
                  height: 48.h,
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
                Container(
                  width: 312.w,
                  height: 48.h,
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account", textAlign: TextAlign.center),
                    TextButton(
                        onPressed: () => Get.put(const RegisterScreen()),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
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
