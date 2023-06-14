import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_controller.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_view.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class BorrowerScreen extends GetView<BorrowerController> {
  const BorrowerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
              Text(
                "Người mượn",
                style: ThemeText.heading2.blue700,
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [listBorrower(controller.listBorrower)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listBorrower(List<Borrower> listBorrower) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () => Get.to(
              () => BorrowerView(borrower: listBorrower[index]),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 110.h,
              child: Card(
                color: AppColors.grey200,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 8.sp, right: 8.sp, top: 5.sp, bottom: 5.sp),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: CircleAvatar(
                            backgroundColor: AppColors.grey200,
                            backgroundImage: const AssetImage(
                              'assets/images/user.png',
                            ),
                            radius: 30.0.sp,
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: AppColors.blue700,
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
                                listBorrower[index].codeUser ?? "",
                                style: ThemeText.bodySemibold.s18.blue700,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "Họ tên: ${listBorrower[index].nameUser}",
                                style: ThemeText.bodyMedium.s14.blue700,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'email: ${listBorrower[index].email}',
                                style: ThemeText.bodyMedium.s14.blue700,
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
}
