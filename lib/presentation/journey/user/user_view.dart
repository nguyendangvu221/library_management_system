import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/presentation/journey/user/create_user.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class UserView extends GetView<UserController> {
  final UserModel user;
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
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColor.blue.shade700,
                    size: 30.sp,
                  ),
                ),
                PopupMenuButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColor.blue.shade700,
                    size: 30.sp,
                  ),
                  shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    1,
                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      onTap: () async {
                        controller.getData(user.id ?? '');
                        Get.to(
                          () => const CreateOrEditUserScreen(
                            isUpdate: true,
                          ),
                        );
                      },
                      child: Text(
                        'Sửa',
                        style: AppTheme.textM.copyWith(
                          fontSize: 16.sp,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async {
                        controller.deleteUserData(user.id ?? '');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Xóa thành công'),
                          ),
                        );
                      },
                      child: Text(
                        'Xóa',
                        style: AppTheme.textM.copyWith(
                          fontSize: 16.sp,
                          color: AppColor.black,
                        ),
                      ),
                    ),
                  ],
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

  Widget displayInfoUser(UserModel user) {
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
              ClipOval(
                child: CircleAvatar(
                  radius: 50.sp,
                  backgroundColor: AppColor.grey.shade100,
                  child: user.avatar?.trim().isEmpty ?? false
                      ? Image.asset(
                          'assets/images/user.png',
                          fit: BoxFit.cover,
                          height: 100.sp,
                          width: 100.sp,
                        )
                      : Image.network(
                          user.avatar ?? '',
                          fit: BoxFit.cover,
                          height: 100.sp,
                          width: 100.sp,
                        ),
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
                    "Giới tính: ${user.gender == 'Male' ? 'Nam' : user.gender == 'Female' ? 'Nữ' : 'Khác'}",
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
