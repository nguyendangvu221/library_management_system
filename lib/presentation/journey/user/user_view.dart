import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class UserView extends GetView<UserController> {
  final User user;
  const UserView({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: Get.mediaQuery.padding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColor.blue.shade700,
                    size: 30.sp,
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.deleteUserData(user.id ?? ''),
                  child: Icon(
                    Icons.delete,
                    color: AppColor.blue.shade700,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.sp,
            ),
            displayInfoUser(user),
            SizedBox(
              height: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget displayInfoUser(User user) {
    return Column(
      children: [
        Container(
          height: 150.w,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
            color: AppColor.grey.shade100,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.sp,
              ),
              CircleAvatar(
                radius: 50.sp,
                backgroundColor: AppColor.grey.shade100,
                backgroundImage: const AssetImage(
                  'assets/images/user.png',
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                user.name ?? "",
                style: AppTheme.textMBold.copyWith(
                  color: AppColor.blue.shade700,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
            color: AppColor.grey.shade100,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email: ${user.email}",
                    style: AppTheme.textM.copyWith(
                      color: AppColor.blue.shade700,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Divider(
                    color: AppColor.blue.shade700,
                    height: 1,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Số điện thoại: ${user.phoneNumber}",
                    style: AppTheme.textM.copyWith(
                      color: AppColor.blue.shade700,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Divider(
                    color: AppColor.blue.shade700,
                    height: 1,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Địa chỉ: ${user.address}",
                    style: AppTheme.textM.copyWith(
                      color: AppColor.blue.shade700,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Divider(
                    color: AppColor.blue.shade700,
                    height: 1,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Ngày sinh: ${user.dateOfBirth.toString().split(" ")[0]}",
                    style: AppTheme.textM.copyWith(
                      color: AppColor.blue.shade700,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Divider(
                    color: AppColor.blue.shade700,
                    height: 1,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Giới tính: ${user.gender}",
                    style: AppTheme.textM.copyWith(
                      color: AppColor.blue.shade700,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
