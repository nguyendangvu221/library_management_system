import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class HomeController extends GetxController {
  final tabs = <Widget>[
    Text(
      "Tab 1",
      style: ThemeText.heading3,
    ),
    Text(
      "Tab 2",
      style: ThemeText.heading3,
    ),
    Text(
      "Tab 3",
      style: ThemeText.heading3,
    ),
  ];
}
