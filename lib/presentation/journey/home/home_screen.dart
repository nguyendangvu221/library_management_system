import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/document_model.dart';
import 'package:library_management_system/presentation/journey/home/book_screen.dart';

import 'package:library_management_system/presentation/journey/home/home_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

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
              Row(
                children: [
                  Text(
                    "Trang chủ",
                    style: AppTheme.heading2.copyWith(
                      color: AppColor.blue.shade600,
                      fontSize: 24.sp,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Icon(
                      Icons.search,
                      color: AppColor.blue.shade600,
                      size: 30.sp,
                    ),
                    onTap: () {
                      Get.toNamed("/search");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    controller.fetchData();
                  },
                  child: CustomScrollView(
                    slivers: [
                      listBuilderTabBarView(
                        document: controller.listDocument,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listBuilderTabBarView({required List<Document> document}) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                Get.to(
                  () => BookScreen(
                    document: document[index],
                  ),
                );
              },
              child: Card(
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
                                "Ngày đăng: ${document[index].releaseDate?.toString() ?? DateTime.now()}",
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
              ),
            ),
          );
        },
        childCount: document.length,
      ),
    );
  }
}
