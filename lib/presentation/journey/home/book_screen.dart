import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/ultils/translations/app_utils.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/home/pdf_viewer.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

import 'home_controller.dart';

class BookScreen extends GetView<HomeController> {
  final Document document;
  final bool? isDelete;
  final void Function()? onTapDelete;
  final void Function() onTapSave;
  const BookScreen({
    required this.document,
    this.isDelete,
    this.onTapDelete,
    required this.onTapSave,
    super.key,
  });

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
                isDelete ?? false
                    ? PopupMenuButton(
                        icon: Icon(
                          Icons.more_vert,
                          color: AppColor.blue.shade700,
                          size: 30.sp,
                        ),
                        shape: ShapeBorder.lerp(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                          ),
                          1,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            onTap: () async {},
                            child: Text(
                              'Sửa',
                              style: AppTheme.textM.copyWith(
                                fontSize: 16.sp,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                          PopupMenuItem(
                            onTap: onTapDelete ?? () {},
                            child: Text(
                              'Xóa',
                              style: AppTheme.textM.copyWith(
                                fontSize: 16.sp,
                                color: AppColor.black,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
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
                                style: AppTheme.textMSemiBold.copyWith(
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
                                  'Số trang: ',
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.numberOfPage.toString(),
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
                                  "Tái bản lần thứ: ",
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.reprint.toString(),
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
                                  document.releaseDate.toString().split(' ')[0],
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
                                  'Người đăng:',
                                  style: AppTheme.textM.copyWith(
                                    color: AppColor.blue.shade700,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  document.namePoster.toString().split(' ')[0],
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
                              onTap: onTapSave,
                              icon: Icons.download,
                            ),
                            _customButton(
                              title: 'Đọc online',
                              onTap: () {
                                Get.to(
                                  () => PdfViewer(
                                    isOnline: true,
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
