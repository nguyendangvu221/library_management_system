import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  var ischeck = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final errorEmail = ''.obs;
  final errorPassword = ''.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    //emailController.text = ' ';
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Get.snackbar('Success', 'login successfully');
      Get.offAllNamed(AppRoutes.main);
    } on FirebaseAuthException catch (e) {
      // Xử lý các mã lỗi khác nhau khi đăng ký không thành công
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
      } else {
        // Xử lý các lỗi khác (nếu cần)
        Get.snackbar('Error', 'Login failed. ${e.message}');
      }
    } catch (e) {
      // Xử lý lỗi chung (nếu cần)
      log(e.toString());
    }
  }

  bool validate() {
    bool isValid = true;

    // Kiểm tra và đặt giá trị cho errorEmail
    if (emailController.text.isEmpty) {
      errorEmail.value = 'Email không được để trống';
      isValid = false;
    } else {
      errorEmail.value = '';
    }

    // Kiểm tra và đặt giá trị cho errorPassword
    if (passwordController.text.isEmpty) {
      errorPassword.value = 'Password không được để trống';
      isValid = false;
    } else {
      errorPassword.value = '';
    }

    return isValid;
  }

  // Hàm onRegister sử dụng hàm validate để kiểm tra và thực hiện đăng ký
  void onLogin() {
    if (validate()) {
      login();
    } else {
      return;
    }
  }
}
