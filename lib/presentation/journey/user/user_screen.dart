import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
//import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:library_management_system/presentation/widget/app_touchable.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: AppTouchable(
          height: 36.sp,
          onPressed: Get.back,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Back',
              )
            ],
          ),
        ),
        title: Text(
          'User',
        ),
      ),
    );
  }
}
