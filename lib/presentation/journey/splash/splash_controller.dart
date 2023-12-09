import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) {
        FirebaseAuth.instance.authStateChanges().listen(
          (User? user) {
            if (user == null) {
              Get.offAllNamed("/login");
            } else {
              Get.offAllNamed(AppRoutes.main);
            }
          },
        );
      },
    );
  }
}
