import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/domain/usecase/setting_usecase.dart';

class SettingController extends GetxController {
  SettingUsecase settingUsecase;
  SettingController({required this.settingUsecase});
  FirebaseAuth auth = FirebaseAuth.instance;
  RxString rxName = ''.obs;
  RxString avatar = ''.obs;
  RxInt role = 1.obs;

  @override
  void onInit() async {
    super.onInit();
    rxName.value = await getFullNameByEmail() ?? '123';
    UserModel userModel = await getUserById();
    avatar.value = userModel.avatar ?? '';
    role.value = userModel.role ?? 1;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<UserModel> getUserById() async {
    return await settingUsecase.getUserById();
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
      Get.offAllNamed(AppRoutes.login);
      signOut();
    };
  }
}
