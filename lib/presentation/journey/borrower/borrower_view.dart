import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class BorrowerView extends GetView<BorrowerController> {
  final HiveBorrower borrower;
  const BorrowerView({required this.borrower, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: Get.mediaQuery.padding.top,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.blue700,
                size: 40.sp,
              ),
            ),
            SizedBox(
              height: 20.sp,
            ),
            displayInfoBorrower(borrower),
            SizedBox(
              height: 20.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget displayInfoBorrower(HiveBorrower borrower) {
    return Column(
      children: [
        Container(
          height: 150.w,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
            color: AppColors.grey200,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.sp,
              ),
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
              Text(borrower.codeUser ?? "",
                  style: ThemeText.bodySemibold.s20.blue700),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.sp)),
            color: AppColors.grey200,
          ),
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Họ tên: ${borrower.nameUser}",
                    style: ThemeText.bodySemibold.s15.blue700,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Email: ${borrower.email}",
                    style: ThemeText.bodySemibold.s15.blue700,
                  ),
                  SizedBox(
                    height: 5.sp,
                  ),
                  Text(
                    "Danh sách tài liệu: ",
                    style: ThemeText.bodySemibold.s15.blue700,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "- ${borrower.borrowedDocument?[index].nameDocument}",
                              style: ThemeText.bodySemibold.s15.blue700),
                          Container(
                            margin: EdgeInsets.only(left: 10.sp),
                            child: Text(
                                "+ ID: ${borrower.borrowedDocument?[index].idDocument}",
                                style: ThemeText.bodyMedium.s15.blue700),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10.sp),
                            child: Text(
                                "+ Hạn trả: ${borrower.borrowedDocument?[index].loanPeriod}",
                                style: ThemeText.bodyMedium.s15.blue700),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                        ],
                      ),
                      itemCount: borrower.borrowedDocument?.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
