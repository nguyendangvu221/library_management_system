import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
                        listBuilderTabBarView(),
                        listBuilderTabBarView(),
                        listBuilderTabBarView(),
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

  Widget listBuilderTabBarView() {
    return
        // child: ListView.builder(
        //   itemBuilder: (context, index) {
        SizedBox(
      child: Card(
        color: AppColors.blue100,
        child: Row(
          children: [
            const Expanded(
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://gamek.mediacdn.vn/133514250583805952/2020/6/30/photo-1-15935006303501558549714-1593500662710349227570.jpg")),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mục thần ký",
                    style: ThemeText.heading2.blue900,
                  ),
                  Text(
                    "Tác giả: Trạch Trư",
                    style: ThemeText.heading3.blue900,
                  ),
                  Text(
                    "Thể loại: Truyện Tu Tiên",
                    style: ThemeText.heading3.blue900,
                  ),
                  Text(
                    "Số trang: 1001 Trang",
                    style: ThemeText.heading3.blue900,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    //   },
    //   itemCount: 1,
    // ),
  }
}
