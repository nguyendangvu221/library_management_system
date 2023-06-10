import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class SearchScreen extends GetView<SearchsController> {
  const SearchScreen({super.key});

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
              "Tìm kiếm",
              style: ThemeText.heading2.blue700,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.search,
                    color: AppColors.blue700,
                    size: 30.sp,
                  ),
                  onTap: () {},
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.sp, bottom: 8.sp),
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: AppColors.blue700),
                          ),
                          hintText: "Nhập tên tài liệu",
                          hintStyle: ThemeText.bodyMedium.blue700),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
