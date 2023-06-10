import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class BorrowerScreen extends GetView<BorrowerController> {
  const BorrowerScreen({super.key});

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
              "Kệ sách",
              style: ThemeText.heading2.blue700,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Card(
                      color: AppColors.grey200,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 160.h,
                              margin: EdgeInsets.all(7.sp),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                              ),
                              child: Image(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  controller.listDocument[index].image ?? "",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                left: 10.sp,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.listDocument[index].name ?? "",
                                    style: ThemeText.heading2.s18.blue700,
                                  ),
                                  Text(
                                    "Tác giả: ${controller.listDocument[index].author ?? ""}",
                                    style: ThemeText.heading4.blue700,
                                  ),
                                  Text(
                                    "Thể loại: ${controller.listDocument[index].category ?? ""}",
                                    style: ThemeText.bodyMedium.blue700,
                                  ),
                                  Text(
                                    "Số trang: ${controller.listDocument[index].numberOfPage.toString()}",
                                    style: ThemeText.bodyMedium.blue700,
                                  ),
                                  Text(
                                    "Ngày đăng: ${controller.listDocument[index].releaseDate?.day.toString() ?? DateTime.now()}",
                                    style: ThemeText.bodyMedium.blue700,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: controller.listDocument.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
