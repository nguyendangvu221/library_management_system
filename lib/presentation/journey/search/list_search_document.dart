import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/home/book_screen.dart';
import 'package:library_management_system/presentation/journey/search/search_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class ListSearchScreen extends GetView<SearchsController> {
  const ListSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(
        () => Padding(
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
                  color: AppColor.blue.shade700,
                  size: 40.sp,
                ),
                onTap: () {
                  Get.back();
                  controller.rxListDocument.clear();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [listSliver(controller.rxListDocument)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listSliver(List<Document> document) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => BookScreen(
                    document: document[index],
                    // index: index,
                    // isBookShelf: false,
                  ));
            },
            child: Container(
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
                                style: AppTheme.heading2.copyWith(color: AppColor.blue.shade700, fontSize: 18.sp),
                              ),
                              Text(
                                "Tác giả: ${document[index].author ?? ""}",
                                style: AppTheme.heading4.copyWith(
                                  color: AppColor.blue.shade700,
                                ),
                              ),
                              Text(
                                "Thể loại: ${document[index].category ?? ""}",
                                style: AppTheme.textMBold.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Số trang: ${document[index].numberOfPage.toString()}",
                                style: AppTheme.textMBold.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Ngày đăng: ${document[index].releaseDate.toString()}",
                                style: AppTheme.textMBold.copyWith(
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
            style: AppTheme.textMBold.copyWith(
              color: AppColor.blue.shade700,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
