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
              style: ThemeText.heading2.blue800,
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: DefaultTabController(
                length: 3,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: AppColors.backgroundColor,
                    elevation: 0,
                    toolbarHeight: 0,
                    flexibleSpace: TabBar(
                      tabs: controller.tabs,
                      labelColor: AppColors.blue800,
                      indicatorColor: AppColors.blue800,
                    ),
                  ),
                  body: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColor,
                    ),
                    child: TabBarView(
                      children: [
                        listBuilderTabBarView(controller.listDocument),
                        listBuilderTabBarView(controller.listDocument),
                        listBuilderTabBarView(controller.listDocument),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listBuilderTabBarView(List<Document> document) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          height: 160.h,
          child: Card(
            color: AppColors.grey200,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5.sp),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                    ),
                    child: const Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://cdn.luatminhkhue.vn/lmk/article/Sach-luat/Giao-trinh-kinh-te-chinh-tri-Mac-Lenin.jpg")),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 10.sp, top: 10.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          document[index].name!,
                          style: ThemeText.heading2.s18.blue900,
                        ),
                        Text(
                          "Tác giả: ${document[index].author!}",
                          style: ThemeText.heading4.blue900,
                        ),
                        Text(
                          "Thể loại: ${document[index].category!}",
                          style: ThemeText.bodyMedium.blue900,
                        ),
                        Text(
                          "Số trang: ${document[index].numberOfPage.toString()}",
                          style: ThemeText.bodyMedium.blue900,
                        ),
                        Text(
                          "Ngày đăng: ${document[index].releaseDate!.day.toString()}",
                          style: ThemeText.bodyMedium.blue900,
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
      itemCount: document.length,
    );
  }
}
