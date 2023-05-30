import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isPasswordHidden1 = true.obs;
  var ischeck1 = false.obs;
  final loginFormKey1 = GlobalKey<FormState>();

  final usernameController1 = TextEditingController();
  final phonenumberController1 = TextEditingController();
  final emailController1 = TextEditingController();
  final passwordController1 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    usernameController1.dispose();
    phonenumberController1.dispose();
    emailController1.dispose();
    passwordController1.dispose();
    super.onClose();
  }

  void login1() {
    if (loginFormKey1.currentState!.validate()) {
      checkUser1(
        usernameController1.text,
        phonenumberController1.text,
        emailController1.text,
        passwordController1.text,
      ).then((auth) {
        if (auth) {
          Get.snackbar('Sign', 'Sign  successfully');
        } else {
          Get.snackbar(
              'Sign', 'Invalid email or password or phonenumber or username');
        }
        passwordController1.clear();
      });
    }
  }

  int? strlen() {
    //nullable function: for example
    return null; //return null for now;
  }

  Future<bool> checkUser1(
      String user, String password, String username, String phonenumber) {
    if (username == 'abc' &&
        phonenumber == '123' &&
        user == 'foo@foo.com' &&
        password == '123') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
