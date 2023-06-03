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
              "Thêm sách",
              style: ThemeText.heading2.blue800,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    textField(
                        hintText: "Tên sách",
                        controller: controller.nameBook,
                        errorText: "Vui lòng điền đủ các trường!!!",
                        height: 40.sp),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: EdgeInsets.only(right: 5.sp),
                            child: textField(
                                hintText: "Tác giả",
                                controller: controller.authorBook,
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(top: 10.sp),
                            child: textField(
                                hintText: "Id",
                                controller: controller.idBook,
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
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
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            // margin: EdgeInsets.only(top: 10.sp),
                            child: textField(
                                hintText: "Thể loại",
                                controller: controller.categoryBook,
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
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
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 15.sp),
                            child: IconButton(
                              icon: Icon(
                                Icons.calendar_month,
                                size: 30.sp,
                                color: AppColors.blue800,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
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
                                controller: controller.paperSizeBook,
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(top: 15.sp),
                            child: textField(
                                hintText: "Khổ giấy",
                                controller: controller.paperSizeBook,
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.sp),
                      child: textField(
                          hintText: "Nhà xuất bản",
                          controller: controller.publisherBook,
                          errorText: "Vui lòng điền đủ các trường!!!",
                          height: 40.sp),
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
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.only(top: 10.sp),
                            child: textField(
                                hintText: "Ngôn ngữ",
                                controller: controller.languageBook,
                                errorText: "Vui lòng điền đủ các trường!!!",
                                height: 40.sp),
                          ),
                        )
                      ],
                    ),
                    textField(
                        hintText: "Link ảnh",
                        controller: controller.imageBook,
                        errorText: "Vui lòng điền đủ các trường!!!",
                        height: 40.sp),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                            margin: EdgeInsets.only(top: 15.sp),
                            child: textField(
                                height: 40.sp,
                                hintText: "Ngày cập nhật",
                                controller: controller.updateDateBook,
                                errorText: "Vui lòng điền đủ các trường!!!"),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(top: 15.sp),
                            child: IconButton(
                              icon: Icon(
                                Icons.calendar_month,
                                size: 30.sp,
                                color: AppColors.blue800,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.sp),
                      child: textField(
                          hintText: "Mô tả",
                          controller: controller.descriptionBook,
                          errorText: "Vui lòng điền đủ trường",
                          height: 100.sp),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AppTouchable(
        onPressed: () {},
        outlinedBorder: RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.circular(AppDimens.space_20)),
        backgroundColor: AppColors.blue800,
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
          style: ThemeText.bodySemibold.s15.blue800,
        ),
        SizedBox(
          height: 5.sp,
        ),
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.blue800,
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
          style: ThemeText.errorText.red,
        ),
      ],
    );
  }
}
