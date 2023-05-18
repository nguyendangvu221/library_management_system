import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/enums.dart';
import 'package:library_management_system/common/ultils/status_bar_style/status_bar_style.dart';
import 'package:library_management_system/common/ultils/status_bar_style/status_bar_style_type.dart';
import 'package:library_management_system/common/ultils/status_bar_style/style_of_status_bar_content.dart';

class BaseAppController extends GetxController {
  late BuildContext context;
  Rx<LoadedType> rxLoadedType = LoadedType.finish.obs;
  Timer? timerLoading;

  void startLoading({int? timeout}) {
    rxLoadedType.value = LoadedType.start;
    timerLoading = Timer(Duration(seconds: timeout ?? 60), finishLoading);
  }

  void finishLoading() {
    rxLoadedType.value = LoadedType.finish;
  }

  void setStatusBarStyle(
      {StatusBarStyleType statusBarStyleType = StatusBarStyleType.dark}) {
    StatusBarStyle()
        .setStatusBarStyle(StyleOfStatusBarContent(statusBarStyleType));
  }
}
