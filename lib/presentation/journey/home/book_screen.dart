import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_dimens.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:library_management_system/presentation/widget/app_touchable.dart';

import '../../../common/constants/app_routes.dart';
import 'home_controller.dart';

class BookScreen extends GetView<HomeController> {
  const BookScreen({super.key});

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
            GestureDetector(
              child: Icon(
                Icons.arrow_back,
                color: AppColors.blue700,
                size: 40.sp,
              ),
              onTap: () => Get.offAllNamed(AppRoutes.home),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 304.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                          color: AppColors.grey200,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            const Image(
                                height: 242.57,
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://cdn.luatminhkhue.vn/lmk/article/Sach-luat/Giao-trinh-kinh-te-chinh-tri-Mac-Lenin.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Kinh tế chính trị Mác- Lênin",
                              style: ThemeText.bodySemibold.s18.blue700,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        color: AppColors.grey200,
                      ),
                      width: double.infinity,
                      height: 290.h,
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          children: [
                            // SizedBox(
                            //   height: 15.h,
                            // ),
                            Row(
                              children: [
                                Text(
                                  'Tác giả: ',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  'Võ Văn Thưởng',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Thể loại:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  'Giáo trình',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Số trang:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' 1500',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Id:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' KMAKTCT',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Nhà xuất bản:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' KMA',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Khổ giấy:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' A4',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ngôn ngữ:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' tiếng Việt',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Số lần tái bản:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' 3',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ngày xuất bản:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' 01/01/2023',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ngày chỉnh sửa:',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  ' 10/01/2023',
                                  style: ThemeText.bodySemibold.s16.blue700,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        color: AppColors.grey200,
                      ),
                      width: double.infinity,
                      height: 200.w,
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Text(
                          'Giáo trình Kinh tế chính trị của Mác-Lênin là một tài liệu lý thuyết và phân tích quan trọng về mối quan hệ kinh tế và chính trị trong thời kỳ cách mạng. Nó cung cấp cái nhìn đa chiều về hệ thống kinh tế và xã hội, và bao gồm các khái niệm quan trọng như cấu trúc kinh tế và quy luật sản xuất.',
                          style: ThemeText.bodyMedium.s16.blue700,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppTouchable(
        onPressed: () {},
        outlinedBorder: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(AppDimens.space_20)),
        backgroundColor: AppColors.blue700,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.sp),
        padding: EdgeInsets.symmetric(vertical: AppDimens.height_14),
        child: Text(
          'Thêm tài liệu',
          style: ThemeText.bodySemibold.copyWith(
            color: AppColors.bianca,
            fontSize: AppDimens.space_18,
          ),
        ),
      ),
    );
  }
}
