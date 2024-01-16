import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/domain/models/hive_document.dart';
import 'package:library_management_system/presentation/journey/home/book_screen.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class SearchScreen extends GetView<SearchsController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: AppColor.blue.shade700,
            size: 25.sp,
          ),
          onTap: () {
            Get.back();
            controller.rxListDocument.clear();
            controller.searchController.clear();
          },
        ),
        title: Text(
          "Tìm kiếm",
          style: AppTheme.heading2.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 24.sp,
          ),
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.sp,
          right: 16.sp,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextInput(
              contentPadding: EdgeInsets.only(
                left: 10.sp,
                right: 10.sp,
              ),
              onSubmitted: (p0) {
                controller.searchDocumentByName(
                  p0,
                );
              },
              controller: controller.searchController,
              hintText: "Nhập tên tài liệu",
              isDense: true,
              colorBoder: AppColor.transparent,
              colorFocusBorder: AppColor.transparent,
              isDisable: false,
            ),
            Divider(
              color: AppColor.blue.shade700,
              thickness: 1.sp,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Obx(
              () => Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => SizedBox(
                    height: 120.sp,
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => BookScreen(
                            onTapSave: () async {
                              await controller.insertDocument(
                                HiveDocument(
                                  author: controller.rxListDocument[index].author ?? "",
                                  category: controller.rxListDocument[index].category ?? "",
                                  id: controller.rxListDocument[index].id ?? "",
                                  image: controller.rxListDocument[index].image ?? "",
                                  language: controller.rxListDocument[index].language ?? "",
                                  name: controller.rxListDocument[index].name ?? "",
                                  releaseDate: controller.rxListDocument[index].releaseDate ?? DateTime.now(),
                                  description: controller.rxListDocument[index].description ?? "",
                                  idPoster: controller.rxListDocument[index].idPoster ?? "",
                                  namePoster: controller.rxListDocument[index].namePoster ?? "",
                                  numberOfEditions: controller.rxListDocument[index].numberOfEditions ?? 0,
                                  numberOfPage: controller.rxListDocument[index].numberOfPage ?? 0,
                                  publisher: controller.rxListDocument[index].publisher ?? "",
                                  pdf: controller.rxListDocument[index].pdf ?? "",
                                  reprint: controller.rxListDocument[index].reprint ?? 0,
                                ),
                                context,
                              );
                            },
                            document: controller.rxListDocument[index],
                          ),
                        );
                      },
                      child: _customCard(
                        controller.rxListDocument,
                        index,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(
                    color: AppColor.blue.shade700,
                    thickness: 1.sp,
                  ),
                  itemCount: controller.rxListDocument.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customCard(List<Document> document, int index) {
    return Card(
      color: AppColor.grey.shade100,
      child: SizedBox(
        height: 120.h,
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
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                  left: 10.sp,
                  top: 10.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.only(left: 200.sp),
                    //   child: GestureDetector(
                    //     onTap: () {},
                    //     child: Icon(
                    //       Icons.more_vert,
                    //       size: 20.sp,
                    //       color: AppColor.blue.shade600,
                    //     ),
                    //   ),
                    // ),
                    Text(
                      document[index].name ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.heading2.copyWith(
                        color: AppColor.blue.shade600,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      "Tác giả: ${document[index].author ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.textMReg.copyWith(
                        color: AppColor.blue.shade600,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      "Thể loại: ${document[index].category ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.textM.copyWith(
                        color: AppColor.blue.shade600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Ngôn ngữ: ${document[index].language.toString()}",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.textM.copyWith(
                        color: AppColor.blue.shade600,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Ngày đăng: ${document[index].releaseDate?.toString().split(' ')[0] ?? DateTime.now()}",
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.textM.copyWith(
                        color: AppColor.blue.shade600,
                        fontSize: 14.sp,
                      ),
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

  // Widget listSliver(List<Document> document) {
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate(
  //       (context, index) {
  //         return Container(
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child:
  //         );
  //       },
  //       childCount: document.length,
  //     ),
  //   );
  // }
}
