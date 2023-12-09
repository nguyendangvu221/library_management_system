import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/presentation/journey/user/user_controller.dart';
import 'package:library_management_system/presentation/journey/user/user_view.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class UserScreen extends GetView<UserController> {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(
            left: 16.sp,
            right: 16.sp,
            top: Get.mediaQuery.padding.top,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Người dùng",
                    style: AppTheme.heading2.copyWith(
                      color: AppColor.blue.shade700,
                      fontSize: 24.sp,
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.refresh_rounded,
                      color: AppColor.blue.shade700,
                      size: 30.sp,
                    ),
                    onTap: () {
                      controller.onRefresh();
                      Get.snackbar("Refresh", "Refresh thành công");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextInput(
                controller: controller.searchController,
                isDisable: false,
                hintText: 'Tìm kiếm',
                hintStyle: AppTheme.textM.copyWith(
                  color: AppColor.blue.shade700,
                  fontSize: 14.sp,
                ),
                seffixIcon: CustomIconButton(
                  isBorder: false,
                  onTap: () {
                    controller.onTapSearch();
                  },
                  isDisable: false,
                  icon: Icons.search,
                  colorIcon: AppColor.blue.shade700,
                  size: 20.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [listBorrower(controller.listUser)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listBorrower(List<User> listBorrower) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.only(bottom: 5.sp),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  UserView(
                    user: listBorrower[index],
                  ),
                );
              },
              child: Card(
                color: AppColor.grey.shade100,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.sp, right: 8.sp, top: 5.sp, bottom: 5.sp),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: CircleAvatar(
                            backgroundColor: AppColor.grey.shade100,
                            backgroundImage: const AssetImage(
                              'assets/images/user.png',
                            ),
                            radius: 30.0.sp,
                          ),
                        ),
                      ),
                      VerticalDivider(
                        color: AppColor.blue.shade700,
                        width: 1,
                      ),
                      Flexible(
                        flex: 5,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Họ tên: ${listBorrower[index].name}",
                                style: AppTheme.textMSemiBold.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 16.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Email: ',
                                style: AppTheme.textM.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                listBorrower[index].email ?? "",
                                style: AppTheme.textM.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        childCount: listBorrower.length,
      ),
    );
  }

  PopupMenuItem _buildAppBarPopUpItem({
    required String title,
    Icon? icon,
    Function()? onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      child: Row(
        children: [
          icon ??
              Icon(
                Icons.info_outline_rounded,
                color: AppColor.blue.shade700,
                size: 25.sp,
              ),
          // SizedBox(
          //   width: AppDimens.width_8,
          // ),
          Text(
            title,
            style: AppTheme.textM.copyWith(
              color: AppColor.blue.shade700,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
