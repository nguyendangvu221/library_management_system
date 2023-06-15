import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/search/list_search_document.dart';
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
                  onTap: () {
                    if (controller.searchController.text.isNotEmpty) {
                      controller
                          .searchDocument(controller.searchController.text);
                      if (controller.rxListDocument.isEmpty) {
                        Get.snackbar(
                            "Không tìm thấy", "Không tìm thấy tài liệu");
                      } else {
                        Get.to(() => const ListSearchScreen());
                      }
                    }
                    controller.searchController.clear();
                  },
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

  Widget listSliver(List<Document> document) {
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
                          left: 10.sp,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              "Ngày đăng: ${document[index].releaseDate.toString()}",
                              style: ThemeText.bodyMedium.blue700,
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
}
