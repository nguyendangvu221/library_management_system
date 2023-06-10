import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

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
              "Trang chủ",
              style: ThemeText.heading2.blue700,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [listBuilderTabBarView(controller.listDocument)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listBuilderTabBarView(List<Document> document) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              color: AppColors.grey200,
              child: SizedBox(
                height: 150.h,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          margin: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              document[index].image ?? "",
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 15.sp,
                          left: 10.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Container(
                            //   margin: EdgeInsets.only(left: 200.sp),
                            //   // child: GestureDetector(
                            //   //   onTap: () {},
                            //   //   child: Icon(
                            //   //     Icons.more_vert,
                            //   //     size: 20.sp,
                            //   //     color: AppColors.blue700,
                            //   //   ),
                            //   // ),
                            // ),
                            Text(
                              document[index].name ?? "",
                              style: ThemeText.heading1.s18.blue700,
                            ),
                            Text(
                              "Tác giả: ${document[index].author ?? ""}",
                              style: ThemeText.heading4.blue700,
                            ),
                            Text(
                              "Thể loại: ${document[index].category ?? ""}",
                              style: ThemeText.bodyMedium.blue700,
                            ),
                            Text(
                              "Số trang: ${document[index].numberOfPage.toString()}",
                              style: ThemeText.bodyMedium.blue700,
                            ),
                            Text(
                              "Ngày đăng: ${document[index].releaseDate?.day.toString() ?? DateTime.now()}",
                              style: ThemeText.bodyMedium.blue700,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: document.length,
      ),
    );
  }
}
