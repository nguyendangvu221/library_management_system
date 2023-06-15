import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class BookShelfScreen extends GetView<HomeController> {
  const BookShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.blue700,
                      size: 40.sp,
                    ),
                    onTap: () => Get.back(),
                  ),
                  SizedBox(
                    width: 5.sp,
                  ),
                  Text(
                    "Kệ sách",
                    style: ThemeText.heading2.blue700,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(left: 175.sp),
                    child: GestureDetector(
                      child: Icon(
                        Icons.refresh_rounded,
                        color: AppColors.blue700,
                        size: 30.sp,
                      ),
                      onTap: () {
                        controller.addDocumentBorrowed();
                        Get.snackbar("Refresh", "Refresh thành công");
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [listSliver(controller.listBorrowed)],
                ),
              )
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
                            Container(
                              alignment: Alignment.centerRight,
                              height: 20.sp,
                              child: PopupMenuButton(
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  color: AppColors.blue700,
                                  size: 20.sp,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    _buildAppBarPopUpItem(
                                        title: "Xem thông tin",
                                        onTap: controller.onTapDocument(
                                            index, true)),
                                    _buildAppBarPopUpItem(
                                      title: "Xóa tài liệu",
                                      onTap: () {
                                        controller.delBorrowedDocument(index);
                                      },
                                    ),
                                  ];
                                },
                              ),
                            ),
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
                color: AppColors.blue700,
                size: 25.sp,
              ),
          // SizedBox(
          //   width: AppDimens.width_8,
          // ),
          Text(
            title,
            style: ThemeText.bodySemibold.s16.blue700,
          ),
        ],
      ),
    );
  }
}
