import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:library_management_system/common/ultils/status_bar_style/style_of_status_bar_content.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';

class StatusBarStyle {
  Color setStatusBarColor() => AppColor.transparent; // Android only
  void setStatusBarStyle(StyleOfStatusBarContent styleOfStatusBarContent) {
    SystemChrome.setSystemUIOverlayStyle(styleOfStatusBarContent.androidStyle
        .copyWith(statusBarColor: setStatusBarColor(), statusBarBrightness: styleOfStatusBarContent.iosStyle));
  }
}
