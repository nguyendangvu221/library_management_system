import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_dimens.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:library_management_system/presentation/widget/app_touchable.dart';

import 'home_controller.dart';

class BookScreen extends GetView<HomeController> {
  final Document document;
  const BookScreen({required this.document, super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: AppColors.blue700,
                    size: 40.sp,
                  ),
                  onTap: () => Get.back(),
                ),
              ],
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
                            Image(
                                height: 240.h,
                                fit: BoxFit.fill,
                                image: NetworkImage(document.image ?? "")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              document.name ?? "",
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
                                  document.author ?? "",
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
                                  document.category ?? "",
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
                                  document.numberOfPage.toString(),
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
                                  'Id: ',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  document.code ?? "",
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
                                  'Nhà xuất bản: ',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  document.publisher ?? "",
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
                                  'Khổ giấy: ',
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  document.paperSize ?? "",
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
                                  document.language ?? "",
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
                                  "Số lần: ",
                                  style: ThemeText.bodyMedium.s16.blue700,
                                ),
                                Text(
                                  document.reprint ?? "",
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
                                  document.releaseDate ?? "",
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
                                  document.updateDate ?? "",
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
                          document.description ?? "",
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
          'Thêm Vào Kệ Sách',
          style: ThemeText.bodySemibold.copyWith(
            color: AppColors.bianca,
            fontSize: AppDimens.space_18,
          ),
        ),
      ),
    );
  }
}
