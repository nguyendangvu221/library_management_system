import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_dimens.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';
import 'package:library_management_system/presentation/widget/app_touchable.dart';

class AddBookScreen extends GetView<AddBookController> {
  const AddBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => Padding(
          padding: EdgeInsets.only(
            left: 16.sp,
            right: 16.sp,
            // bottom: Get.mediaQuery.padding.bottom,
            top: Get.mediaQuery.padding.top,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thêm sách",
                style: ThemeText.heading2.blue700,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: [
                      textField(
                          hintText: "Tên sách",
                          controller: controller.nameBook,
                          errorText: controller.validateNameBook.value,
                          height: 45.sp),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(right: 5.sp),
                              child: textField(
                                  hintText: "Tác giả",
                                  controller: controller.authorBook,
                                  errorText:
                                      controller.validateAuthorBook.value,
                                  height: 45.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.sp),
                              child: textField(
                                  hintText: "Id",
                                  controller: controller.idBook,
                                  errorText: controller.validateIdBook.value,
                                  height: 45.sp),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(right: 5.sp, top: 10.sp),
                              child: textField(
                                  hintText: "Số tái bản",
                                  controller: controller.reprintBook,
                                  errorText:
                                      controller.validateReprintBook.value,
                                  height: 45.sp),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              // margin: EdgeInsets.only(top: 10.sp),
                              child: textField(
                                  hintText: "Thể loại",
                                  controller: controller.categoryBook,
                                  errorText:
                                      controller.validateCategoryBook.value,
                                  height: 45.sp),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              margin: EdgeInsets.only(top: 15.sp),
                              child: textField(
                                  hintText: "Ngày phát hành",
                                  controller: controller.releaseDateBook,
                                  errorText:
                                      controller.validateReleaseDateBook.value,
                                  height: 45.sp),
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     margin: EdgeInsets.only(top: 15.sp),
                          //     child: IconButton(
                          //       icon: Icon(
                          //         Icons.calendar_month,
                          //         size: 30.sp,
                          //         color: AppColors.blue700,
                          //       ),
                          //       onPressed: () {},
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(right: 5.sp, top: 15.sp),
                              child: textField(
                                  hintText: "Số trang",
                                  controller: controller.numberOfBook,
                                  errorText:
                                      controller.validatePaperSizeBook.value,
                                  height: 45.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(top: 15.sp),
                              child: textField(
                                  hintText: "Khổ giấy",
                                  controller: controller.paperSizeBook,
                                  errorText:
                                      controller.validatePaperSizeBook.value,
                                  height: 45.sp),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.sp),
                        child: textField(
                            hintText: "Nhà xuất bản",
                            controller: controller.publisherBook,
                            errorText: controller.validatePublisherBook.value,
                            height: 45.sp),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              margin: EdgeInsets.only(right: 5.sp),
                              child: textField(
                                  hintText: "Số phiên bản",
                                  controller: controller.numberOfEditionsBook,
                                  errorText: controller
                                      .validateNumberOfEditionBook.value,
                                  height: 45.sp),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(top: 10.sp),
                              child: textField(
                                  hintText: "Ngôn ngữ",
                                  controller: controller.languageBook,
                                  errorText:
                                      controller.validateLanguageBook.value,
                                  height: 45.sp),
                            ),
                          )
                        ],
                      ),
                      textField(
                          hintText: "Link ảnh",
                          controller: controller.imageBook,
                          errorText: controller.validateImageBook.value,
                          height: 45.sp),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                              margin: EdgeInsets.only(top: 15.sp),
                              child: textField(
                                  height: 45.sp,
                                  hintText: "Ngày cập nhật",
                                  controller: controller.updateDateBook,
                                  errorText:
                                      controller.validateUpdateDateBook.value),
                            ),
                          ),
                          // Expanded(
                          //   flex: 1,
                          //   child: Container(
                          //     margin: EdgeInsets.only(top: 15.sp),
                          //     child: IconButton(
                          //       icon: Icon(
                          //         Icons.calendar_month,
                          //         size: 30.sp,
                          //         color: AppColors.blue700,
                          //       ),
                          //       onPressed: () {},
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10.sp),
                        child: textField(
                            hintText: "Mô tả",
                            controller: controller.descriptionBook,
                            errorText: controller.validateDescriptionBook.value,
                            height: 100.sp),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AppTouchable(
        onPressed: () => _buttonAddDocument(context),
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

  Widget textField(
      {required String hintText,
      required TextEditingController controller,
      required String? errorText,
      required double height}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hintText,
          style: ThemeText.bodySemibold.s15.blue700,
        ),
        SizedBox(
          height: 5.sp,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.blue700,
              width: 0.5,
            ),
          ),
          child: Center(
            child: TextFormField(
              expands: true,
              maxLines: null,
              textAlign: TextAlign.center,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
              // ],
              style: ThemeText.bodyMedium.s16,
              // keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          errorText ?? '',
          style: ThemeText.errorText.red.s10,
        ),
      ],
    );
  }

  _buttonAddDocument(BuildContext context) async {
    await controller.addDocument();
  }
}
