import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/domain/models/hive_account.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';
import 'package:library_management_system/presentation/journey/login/login_screen.dart';

class RegisterController extends GetxController {
  BorrowerUsecase borrowerUsecase;
  RegisterUseCase registerUseCase;
  RegisterController(
      {required this.borrowerUsecase, required this.registerUseCase});
  var isPasswordHidden1 = true.obs;
  var ischeck1 = false.obs;
  final loginFormKey1 = GlobalKey<FormState>();

  final usernameController1 = TextEditingController();
  final nameController1 = TextEditingController();
  final emailController1 = TextEditingController();
  final passwordController1 = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    usernameController1.dispose();
    nameController1.dispose();
    emailController1.dispose();
    passwordController1.dispose();
    super.onClose();
  }

  void login1() {
    if (loginFormKey1.currentState!.validate()) {
      registerUseCase.addAccount(
        HiveAccounts(
          code: usernameController1.text,
          name: nameController1.text,
          email: emailController1.text,
          password: passwordController1.text,
        ),
      );
      borrowerUsecase.addBorrower(
        HiveBorrower(
          codeUser: usernameController1.text,
          nameUser: nameController1.text,
          email: emailController1.text,
          borrowedDocument: [],
        ),
      );
      Get.offNamed(AppRoutes.login);
      log("register thanh cong");
      log(borrowerUsecase.getCode(0).toString());
      log(registerUseCase.getCode(0).toString());
      // Get.snackbar(
      //     'Sign', 'Invalid email or password or phonenumber or username');
    } else {}
    clearData();
  }

  clearData() {
    usernameController1.clear();
    nameController1.clear();
    emailController1.clear();
    passwordController1.clear();
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
