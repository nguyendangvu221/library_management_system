import 'package:get/get.dart';
import 'package:library_management_system/common/ultils/status_bar_style/status_bar_style.dart';
import 'package:library_management_system/common/ultils/status_bar_style/status_bar_style_type.dart';
import 'package:library_management_system/common/ultils/status_bar_style/style_of_status_bar_content.dart';
import 'package:library_management_system/common/ultils/translations/app_utils.dart';

class AppController extends SuperController {
  
  @override
  void onDetached() {
    logger('---------App State onDetached');
  }

  @override
  void onInactive() {
    logger('---------App State onInactive');
  }

  @override
  void onPaused() {
    logger('---------App State onPaused');
  }

  @override
  void onResumed() {
    logger('---------App State onResumed');
  }

  @override
  void onReady() {
    super.onReady();
    StatusBarStyle()
        .setStatusBarStyle(StyleOfStatusBarContent(StatusBarStyleType.dark));
  }
}
