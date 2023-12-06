import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/common/ultils/translations/app_utils.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class AddBookScreen extends GetView<AddBookController> {
  const AddBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    logger('Building BookScreen');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backgroundColor,
        title: Text(
          'Thêm sách',
          style: AppTheme.textMBold.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 24.sp,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        child: CustomDefaultButton(
          textButton: 'Thêm tài liệu',
          backgroundColor: AppColor.blue.shade700,
          onPressed: () {
            _buttonAddDocument(context);
          },
        ),
      ),
      backgroundColor: AppColor.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16.sp,
              right: 16.sp,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              // bottom: Get.mediaQuery.padding.bottom,
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  _customTextInput(
                    text: 'Tên tài liệu',
                    textInput: CustomTextInput(
                      textInputAction: TextInputAction.next,
                      isDisable: false,
                      controller: controller.nameBook,
                      errorText: controller.validateNameBook.value,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  _customTextInput(
                    text: 'Tác giả',
                    textInput: CustomTextInput(
                      textInputAction: TextInputAction.next,
                      isDisable: false,
                      controller: controller.authorBook,
                      errorText: controller.validateAuthorBook.value,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 5.sp),
                          child: _customTextInput(
                            text: 'Số lần tái bản',
                            textInput: CustomTextInput(
                              textInputAction: TextInputAction.next,
                              isDisable: false,
                              controller: controller.reprintBook,
                              errorText: controller.validateReprintBook.value,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: _customTextInput(
                            text: 'Thể loại',
                            textInput: CustomTextInput(
                              textInputAction: TextInputAction.next,
                              isDisable: false,
                              controller: controller.categoryBook,
                              errorText: controller.validateCategoryBook.value,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          margin: EdgeInsets.only(top: 15.sp),
                          child: _customTextInput(
                            text: 'Ngày phát hành',
                            textInput: CustomTextInput(
                              textInputAction: TextInputAction.next,
                              isDisable: false,
                              controller: controller.releaseDateBook,
                              errorText: controller.validateReleaseDateBook.value,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 5.sp, top: 15.sp),
                          child: _customTextInput(
                            text: 'Số trang',
                            textInput: CustomTextInput(
                              isDisable: false,
                              textInputAction: TextInputAction.next,
                              controller: controller.numberOfBook,
                              errorText: controller.validateNumberOfBook.value,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 15.sp),
                          child: _customTextInput(
                            text: 'Khổ giấy',
                            textInput: CustomTextInput(
                              textInputAction: TextInputAction.next,
                              isDisable: false,
                              controller: controller.paperSizeBook,
                              errorText: controller.validatePaperSizeBook.value,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  Container(
                    margin: EdgeInsets.only(top: 10.sp),
                    child: _customTextInput(
                      text: 'Nhà xuất bản',
                      textInput: CustomTextInput(
                        textInputAction: TextInputAction.next,
                        isDisable: false,
                        controller: controller.publisherBook,
                        errorText: controller.validatePaperSizeBook.value,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 5.sp),
                          child: _customTextInput(
                            text: 'Số phiên bản',
                            textInput: CustomTextInput(
                              textInputAction: TextInputAction.next,
                              isDisable: false,
                              controller: controller.numberOfEditionsBook,
                              errorText: controller.validateNumberOfEditionBook.value,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: _customTextInput(
                            text: 'Ngôn ngữ',
                            textInput: CustomTextInput(
                              textInputAction: TextInputAction.next,
                              isDisable: false,
                              controller: controller.languageBook,
                              errorText: controller.validateLanguageBook.value,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  Container(
                    margin: EdgeInsets.only(top: 10.sp),
                    child: _customTextInput(
                      text: 'Mô tả',
                      textInput: CustomTextInput(
                        textInputAction: TextInputAction.done,
                        isDisable: false,
                        controller: controller.descriptionBook,
                        errorText: controller.validateDescriptionBook.value,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                  controller.imageBook.value.isEmpty
                      ? Column(
                          children: [
                            Center(
                              child: CustomIconButton(
                                isBorder: false,
                                onTap: () {
                                  controller.pickImageFromGallery();
                                },
                                isDisable: true,
                                iconSVG: SvgPicture.asset(
                                  'assets/svg/add_image.svg',
                                  colorFilter: ColorFilter.mode(
                                    AppColor.blue.shade700,
                                    BlendMode.srcIn,
                                  ),
                                  height: 25.sp,
                                  width: 25.sp,
                                ),
                              ),
                            ),
                            Center(
                              child: CustomTextButton(
                                textButton: 'Thêm ảnh',
                                textColor: AppColor.blue.shade700,
                                onTap: () {
                                  controller.pickImageFromGallery();
                                },
                                isDisable: false,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/image-gallery.svg',
                                    colorFilter: ColorFilter.mode(
                                      AppColor.blue.shade700,
                                      BlendMode.srcIn,
                                    ),
                                    height: 25.sp,
                                    width: 25.sp,
                                  ),
                                  SizedBox(
                                    width: 10.sp,
                                  ),
                                  CustomIconButton(
                                    isBorder: false,
                                    onTap: () {
                                      controller.nameImage.value = '';
                                      controller.imageBook.value = '';
                                    },
                                    isDisable: false,
                                    icon: Icons.cancel,
                                  )
                                ],
                              ),
                            ),
                            Text(
                              controller.nameImage.value,
                              style: AppTheme.textMReg.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                  SizedBox(height: 20.sp),
                  controller.namePdf.isEmpty
                      ? Column(
                          children: [
                            Center(
                              child: CustomIconButton(
                                isBorder: false,
                                onTap: () {
                                  controller.pickedFile();
                                },
                                isDisable: true,
                                iconSVG: SvgPicture.asset(
                                  'assets/svg/new-document.svg',
                                  colorFilter: ColorFilter.mode(
                                    AppColor.blue.shade700,
                                    BlendMode.srcIn,
                                  ),
                                  height: 25.sp,
                                  width: 25.sp,
                                ),
                              ),
                            ),
                            Center(
                              child: CustomTextButton(
                                textButton: 'Thêm File',
                                textColor: AppColor.blue.shade700,
                                onTap: () {
                                  controller.pickedFile();
                                },
                                isDisable: false,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/fill_document.svg',
                                    colorFilter: ColorFilter.mode(
                                      AppColor.blue.shade700,
                                      BlendMode.srcIn,
                                    ),
                                    height: 25.sp,
                                    width: 25.sp,
                                  ),
                                  SizedBox(
                                    width: 10.sp,
                                  ),
                                  CustomIconButton(
                                    isBorder: false,
                                    onTap: () {
                                      controller.pdfPicker.value = '';
                                      controller.namePdf.value = '';
                                    },
                                    isDisable: false,
                                    icon: Icons.cancel,
                                  ),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(
                                controller.namePdf.value,
                                style: AppTheme.textMReg.copyWith(
                                  color: AppColor.blue.shade700,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 30.sp,
                  ),
                  SizedBox(
                    height: 70.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextInput({
    required String text,
    required Widget textInput,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTheme.textMReg.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        textInput,
      ],
    );
  }

  _buttonAddDocument(BuildContext context) async {
    await controller.addDocument();
  }
}
