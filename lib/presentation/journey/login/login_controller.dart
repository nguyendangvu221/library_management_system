import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/domain/models/hive_account.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;
  var ischeck = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  final passwordController = TextEditingController();
  RegisterUseCase registerUseCase;
  LoginController({required this.registerUseCase});
  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    //emailController.text = ' ';
    super.onInit();
  }

  @override
  void onClose() {
    codeController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      for (int index = 0; index < registerUseCase.getLength(); index++) {
        if (registerUseCase.getCode(index)?.toLowerCase() ==
            codeController.text.toLowerCase()) {
          if (registerUseCase.getPassword(index)?.toLowerCase() ==
              passwordController.text.toLowerCase()) {
            registerUseCase.updateAccount(
                HiveAccounts(
                  code: registerUseCase.getCode(index),
                  name: registerUseCase.getName(index),
                  email: registerUseCase.getEmail(index),
                  password: registerUseCase.getPassword(index),
                  isLogin: true,
                ),
                index);
            Get.offNamed(AppRoutes.main);
            Get.snackbar("Login", "Login thành công!!");
            return;
          }
        }
      }

      Get.snackbar("Login", "mật khẩu hoặc tài khoản không đúng!!!");
    }
  }

  Future<bool> checkUser(String user, String password) {
    if (user == 'gfgf' && password == '') {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
