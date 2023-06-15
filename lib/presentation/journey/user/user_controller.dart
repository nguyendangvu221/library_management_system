import 'package:get/get.dart';
import 'package:library_management_system/domain/models/hive_account.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';

class UserController extends GetxController {
  RegisterUseCase registerUseCase;
  BorrowerUsecase borrowerUsecase;
  UserController(
      {required this.registerUseCase, required this.borrowerUsecase});

  String? getNameLogin() {
    for (int i = 0; i < registerUseCase.getLength(); i++) {
      if (registerUseCase.getIsLogin(i) == true) {
        return registerUseCase.getName(i);
      }
    }
    return null;
  }

  Function()? onPressedOfLogout() {
    return () {
      for (int i = 0; i < registerUseCase.getLength(); i++) {
        if (registerUseCase.getIsLogin(i) == true) {
          registerUseCase.updateAccount(
              HiveAccounts(
                code: registerUseCase.getCode(i),
                name: registerUseCase.getName(i),
                email: registerUseCase.getEmail(i),
                password: registerUseCase.getPassword(i),
                isLogin: false,
              ),
              i);
        }
      }
      for (int i = 0; i < borrowerUsecase.getLength(); i++) {
        if (borrowerUsecase.getIsLogin(i) == true) {
          borrowerUsecase.updateBorrower(
            HiveBorrower(
              codeUser: registerUseCase.getCode(i),
              nameUser: registerUseCase.getName(i),
              email: registerUseCase.getEmail(i),
              borrowedDocument: [],
              isLogin: false,
            ),
            i,
          );
        }
      }
      Get.offNamed('/login');
    };
  }
}
