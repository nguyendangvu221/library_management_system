import 'package:get/get.dart';
import 'package:library_management_system/domain/models/hive_account.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';

class UserController extends GetxController {
  RegisterUseCase registerUseCase;
  UserController({required this.registerUseCase});

  String? getNameLogin() {
    for (int i = 0; i < registerUseCase.getLength(); i++) {
      if (registerUseCase.getIsLogin(i) == true) {
        return registerUseCase.getName(i);
      }
    }
    return null;
  }

  Function()? onPressedOfLogout() {
    for (int i = 0; i < registerUseCase.getLength(); i++) {
      if (registerUseCase.getIsLogin(i) == true) {
        return () {
          registerUseCase.updateAccount(
              HiveAccounts(
                code: registerUseCase.getCode(i),
                name: registerUseCase.getName(i),
                email: registerUseCase.getEmail(i),
                password: registerUseCase.getPassword(i),
                isLogin: false,
              ),
              i);
          Get.offNamed('/login');
        };
      }
    }
    return null;
  }
}
