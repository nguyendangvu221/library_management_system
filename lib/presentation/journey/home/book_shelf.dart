import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/journey/home/pdf_viewer.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class BookShelfScreen extends GetView<HomeController> {
  const BookShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.sp,
          right: 16.sp,
          top: Get.mediaQuery.padding.top,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.blue.shade700,
                          size: 25.sp,
                        ),
                        onTap: () => Get.back(),
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Text(
                        "Kệ sách",
                        style: AppTheme.heading2.copyWith(
                          color: AppColor.blue.shade700,
                          fontSize: 24.sp,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.refresh_rounded,
                      color: AppColor.blue.shade700,
                      size: 25.sp,
                    ),
                    onTap: () async {
                      await controller.fetDataHiveBox();
                      Get.snackbar("Refresh", "Refresh thành công");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    listSliver(controller.listHiveDocument),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listSliver(List<HiveDocument> document) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              color: AppColor.grey.shade200,
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          height: 100.sp,
                          margin: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            image: FileImage(
                              File(document[index].image ?? ""),
                            ),
                          )),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          left: 10.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              height: 20.sp,
                              child: PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  color: AppColor.blue.shade700,
                                  size: 20.sp,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    _buildAppBarPopUpItem(
                                      title: "Xem thông tin",
                                      onTap: () {
                                        Get.to(
                                          PdfViewer(
                                            isOnline: false,
                                            pdfUrl: document[index].pdf ?? "",
                                            namePdf: document[index].name ?? '',
                                          ),
                                        );
                                      },
                                    ),
                                    _buildAppBarPopUpItem(
                                      title: "Xóa tài liệu",
                                      onTap: () async {
                                        // controller.clearHiveDocument();
                                        await controller.deleteDocument(index);
                                        await controller.fetDataHiveBox();

                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text("Xóa tài liệu thành công"),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ];
                                },
                              ),
                            ),
                            Text(
                              document[index].name ?? "",
                              style: AppTheme.textMSemiBold.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "Tác giả: ${document[index].author ?? ""}",
                              style: AppTheme.text.copyWith(
                                color: AppColor.blue.shade700,
                              ),
                            ),
                            Text(
                              "Thể loại: ${document[index].category ?? ""}",
                              style: AppTheme.textM.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "Số trang: ${document[index].numberOfPage.toString()}",
                              style: AppTheme.textM.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 14.sp,
                              ),
                            ),
                            Text(
                              "Ngày đăng: ${document[index].releaseDate?.toString().split(' ')[0] ?? DateTime.now()}",
                              style: AppTheme.textM.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10.sp,
                            )
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

  PopupMenuItem _buildAppBarPopUpItem({
    required String title,
    Icon? icon,
    Function()? onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      child: Row(
        children: [
          icon ??
              Icon(
                Icons.info_outline_rounded,
                color: AppColor.blue.shade700,
                size: 25.sp,
              ),
          // SizedBox(
          //   width: AppDimens.width_8,
          // ),
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
