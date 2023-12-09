import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/home/book_shelf.dart';
import 'package:library_management_system/presentation/journey/setting/setting_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.sp,
              right: 16.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cài đặt",
                  style: AppTheme.heading2.copyWith(
                    color: AppColor.blue.shade700,
                    fontSize: 24.sp,
                  ),
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
                        color: AppColor.grey.shade50,
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50.sp,
                            backgroundColor: AppColor.grey.shade50,
                            backgroundImage: const AssetImage(
                              'assets/images/user.png',
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          Text(controller.rxName.value,
                              style: AppTheme.textMSemiBold.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 20.sp,
                              )),
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
                      () => Get.to(
                        () => const BookShelfScreen(),
                      ),
                      const Icon(Icons.library_books),
                    ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // buttonOfSetting(
                    //   40.w,
                    //   "Đổi mật khẩu",
                    //   () => null,
                    //   const Icon(Icons.settings),
                    // ),
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
                        60.w, "Điều khoản sử dụng và vấn đề bản quyền", () => null, const Icon(Icons.error)),
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
        ),
      ),
    );
  }

  Widget buttonOfSetting(double height, String? label, Function()? onPressed, Icon icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
        color: AppColor.grey.shade50,
      ),
      width: double.infinity,
      height: height,
      child: TextButton.icon(
        style: const ButtonStyle(alignment: Alignment.bottomLeft),
        icon: icon,
        label: Text(
          label ?? "",
          style: AppTheme.textMReg.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 17.sp,
          ),
          textAlign: TextAlign.left,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
