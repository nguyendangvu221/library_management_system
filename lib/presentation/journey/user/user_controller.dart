import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/hive_account.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Function()? onPressedOfLogout() {
    return () {
      Get.offNamed('/login');
      signOut();
    };
  }
}
