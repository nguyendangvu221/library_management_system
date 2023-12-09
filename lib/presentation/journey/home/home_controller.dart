import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/domain/usecase/home_usecase.dart';

class HomeController extends GetxController {
  HomeUsecase homeUsecase;
  HomeController({
    required this.homeUsecase,
  });
  @override
  void onInit() async {
    await fetchData();
    super.onInit();

    log(getCurrentEmail());
  }

  RxList<Document> listDocument = <Document>[].obs;
  String getCurrentEmail() {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        log(currentUser.phoneNumber ?? '');
        return currentUser.email ?? '';
      } else {
        return 'dell co';
      }
    } catch (e) {
      log('Error in getCurrentEmail(): $e');
      return '';
    }
  }

  Future<void> fetchData() async {
    listDocument.value = await homeUsecase.fetchListDocument();
    update(); // Đảm bảo cập nhật UI khi thay đổi giá trị của RxList
  }
}
