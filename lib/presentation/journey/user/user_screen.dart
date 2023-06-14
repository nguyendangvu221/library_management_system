import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.sp,
          right: 16.sp,
          top: Get.mediaQuery.padding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cài đặt",
              style: ThemeText.heading2.blue700,
            ),
            Column(
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                Container(
                  height: 140.w,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                    color: AppColors.grey200,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.sp,
                        backgroundColor: AppColors.grey200,
                        backgroundImage: const AssetImage(
                          'assets/images/user.png',
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(controller.getNameLogin() ?? "",
                          style: ThemeText.bodySemibold.s20.blue700),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                buttonOfSetting(
                  40.w,
                  "Hướng dẫn sử dụng",
                  () => null,
                  const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 20,
                ),
                buttonOfSetting(
                  40.w,
                  "Thông báo",
                  () => null,
                  const Icon(Icons.error),
                ),
                const SizedBox(
                  height: 20,
                ),
                buttonOfSetting(
                  40.w,
                  "Kệ sách",
                  () => null,
                  const Icon(Icons.library_books),
                ),
                const SizedBox(
                  height: 20,
                ),
                buttonOfSetting(
                  40.w,
                  "Đổi mật khẩu",
                  () => null,
                  const Icon(Icons.settings),
                ),
                const SizedBox(
                  height: 20,
                ),
                buttonOfSetting(
                  40.w,
                  "Gửi email yêu cầu trợ giúp",
                  () => null,
                  const Icon(Icons.email),
                ),
                const SizedBox(
                  height: 20,
                ),
                buttonOfSetting(
                    60.w,
                    "Điều khoản sử dụng và vấn đề bản quyền",
                    () => null,
                    const Icon(Icons.error)),
                const SizedBox(
                  height: 20,
                ),
                buttonOfSetting(
                  40.w,
                  "Đăng xuất",
                  controller.onPressedOfLogout(),
                  const Icon(Icons.logout),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buttonOfSetting(
      double height, String? label, Function()? onPressed, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        color: AppColors.grey200,
      ),
      width: double.infinity,
      height: height,
      child: TextButton.icon(
        style: const ButtonStyle(alignment: Alignment.bottomLeft),
        icon: icon,
        label: Text(
          label ?? "",
          style: ThemeText.bodySemibold.s17.blue700,
          textAlign: TextAlign.left,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
