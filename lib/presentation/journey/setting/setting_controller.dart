import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/usecase/register_usecase.dart';
import 'package:library_management_system/domain/usecase/setting_usecase.dart';

class SettingController extends GetxController {
  SettingUsecase settingUsecase;
  SettingController({required this.settingUsecase});
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString rxName = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    rxName.value = await getFullNameByEmail() ?? '123';
    log(rxName.value);
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<String?> getFullNameByEmail() async {
    return await settingUsecase.getUserNameByEmail(getCurrentEmail());
  }

  String getCurrentEmail() {
    try {
      final currentUser = auth.currentUser;
      if (currentUser != null) {
        log(currentUser.email ?? '');
        return currentUser.email ?? '';
      } else {
        return 'dell co';
      }
    } catch (e) {
      log('Error in getCurrentEmail(): $e');
      return '';
    }
  }

  Function()? onPressedOfLogout() {
    return () {
      Get.offNamed('/login');
      signOut();
    };
  }
}
