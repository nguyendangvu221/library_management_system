import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/login/login_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../../common/constants/app_routes.dart';
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
                      color: AppColors.blue700,
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
                  style: TextStyle(
                    color: AppColors.blue700,
                    fontSize: 14,
                  ),
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
                        Container(
                          width: 312.h,
                          height: 80.w,
                          child: TextFormField(
                            controller: controller.emailController,
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
                              hintText: 'example@gmail.com',
                              hintStyle: TextStyle(color: AppColors.blue700,
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
                        ),
                        
                        Text(
                          'Password',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColors.blue700,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(
                          () => Container(
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
                                hintStyle: TextStyle(color: AppColors.blue700,
                                fontSize: 16,),
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
                        ),
                      ],
                    ),
                  ),
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
                    Text('Remember Me', textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15,),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(color: AppColors.errorColor,fontSize: 15,),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                    child: Text('Login',style: TextStyle(fontSize: 16),),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.blue700,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                        width: 70.h,
                        child: Text(
                          'Or With',
                          style: TextStyle(color: AppColors.blue700,
                          fontSize: 18,),
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
                  height: 50,
                ),
                Container(
                  width: 312.w,
                  height: 48.h,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.white,

                      side: BorderSide(color: AppColors.blue700), //<-- SEE HERE
                    ),
                    child: Text(
                      'Login with Barcode',
                      style: TextStyle(color: AppColors.blue700,
                      fontSize: 16,),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16,),),
                    TextButton(
                        onPressed: () =>  Get.offAllNamed(AppRoutes.register),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16,),
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
