import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_dimens.dart';
import 'package:library_management_system/common/ultils/translations/app_utils.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/home/pdf_viewer.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:library_management_system/presentation/widget/app_touchable.dart';

import 'home_controller.dart';

class BookScreen extends GetView<HomeController> {
  final Document document;
  const BookScreen({required this.document, super.key});

  @override
  Widget build(BuildContext context) {
    logger('Building BookScreen');
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
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
                    color: AppColor.blue.shade700,
                    size: 30.sp,
                  ),
                  onTap: () => Get.back(),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: AppColor.blue.shade700,
                    size: 30.sp,
                  ),
                  onTap: () {
                    //TODO: delete book
                  },
                )
              ],
            ),
            SizedBox(
              height: 20.h,
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
                          color: AppColor.grey.shade100,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Image(
                              height: 240.h,
                              width: 150.w,
                              fit: BoxFit.fill,
                              image: NetworkImage(document.image ?? ""),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Text(
                                document.name ?? "",
                                style: AppTheme.textM.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        color: AppColor.grey.shade100,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tác giả: ',
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.author ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.category ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Nhà xuất bản: ',
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.publisher ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.paperSize ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.language ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.reprint ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.releaseDate ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.updateDate ?? "",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
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
                        color: AppColor.grey.shade100,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(16.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mô tả:',
                              style: AppTheme.textMBold.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 16.sp,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              document.description ?? "",
                              style: AppTheme.textM.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        color: AppColor.grey.shade100,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _customButton(
                              title: 'Tải xuống',
                              onTap: () {
                                //TODO: download book
                              },
                              icon: Icons.download,
                            ),
                            _customButton(
                              title: 'Đọc online',
                              onTap: () {
                                Get.to(
                                  PdfViewer(
                                    pdfUrl: document.pdf ?? "",
                                    namePdf: document.name ?? '',
                                  ),
                                );
                              },
                              icon: Icons.menu_book,
                            ),
                            _customButton(
                              title: 'Báo lỗi',
                              onTap: () {
                                //TODO: warning book
                              },
                              icon: Icons.warning,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customButton({
    required String title,
    required Function() onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColor.blue.shade700,
            size: 30.sp,
          ),
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
