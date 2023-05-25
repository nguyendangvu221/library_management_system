import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt rxCurrentNavIndex = 0.obs;
  RxBool isLogin = false.obs;

  Future<void> onChangedNav(int index) async {
    rxCurrentNavIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
