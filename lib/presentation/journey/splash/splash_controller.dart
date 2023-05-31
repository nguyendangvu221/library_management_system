import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Get.offAllNamed(AppRoutes.register);
    });
  }
}
