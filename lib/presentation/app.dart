import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/common/injector/bindings/app_binding.dart';
import 'package:library_management_system/presentation/app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          initialRoute: AppRoutes.splash,
          getPages: myPages,
        );
      },
    );
  }
}
