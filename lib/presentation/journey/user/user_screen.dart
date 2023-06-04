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
          
        ),
        child: ListView(
          children: [
            Text(
              "Cài đặt",
              style: ThemeText.heading2.blue800,
            ),
            
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: 350.h,
                    height: 138.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: AppColors.grey1,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://s3.o7planning.com/images/boy-128.png"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Họ và Tên",
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.blue700,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey1,
                  ),
                  width: 350.h,
                  height: 40.w,
                  child: TextButton.icon(
                    style: ButtonStyle(alignment: Alignment.bottomLeft),
                    icon: const Icon(Icons.error_outline),
                    label: const Text(
                      'Hướng dẫn sử dụng',
                      style: TextStyle(color: AppColors.blue700, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey1,
                  ),
                  width: 350.h,
                  height: 40.w,
                  child: TextButton.icon(
                    style: ButtonStyle(alignment: Alignment.bottomLeft),
                    icon: const Icon(Icons.error_outline),
                    label: const Text(
                      'Thông báo',
                      style: TextStyle(color: AppColors.blue700, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey1,
                  ),
                  width: 350.h,
                  height: 40.w,
                  child: TextButton.icon(
                    style: ButtonStyle(alignment: Alignment.bottomLeft),
                    icon: const Icon(Icons.mail_outline_rounded),
                    label: const Text(
                      'Gửi Email yêu cầu trợ giúp',
                      style: TextStyle(color: AppColors.blue700, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey1,
                  ),
                  width: 350.h,
                  height: 55.w,
                  child: TextButton.icon(
                    style: ButtonStyle(alignment: Alignment.bottomLeft),
                    icon: const Icon(Icons.error_outline),
                    label: const Text(
                      'Điều khoản sử dụng và vấn đề bản quyền',
                      style: TextStyle(color: AppColors.blue700, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.grey1,
                  ),
                  width: 350.h,
                  height: 40.w,
                  child: TextButton.icon(
                    style: ButtonStyle(alignment: Alignment.bottomLeft),
                    icon: const Icon(Icons.logout_outlined),
                    label: const Text(
                      ///fffff
                      'Đăng xuất',
                      style: TextStyle(color: AppColors.blue700, fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
      ),
    ),
    );
  }
}
