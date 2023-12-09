// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:library_management_system/common/constants/app_dimens.dart';
// import 'package:library_management_system/presentation/journey/home/home_controller.dart';
// import 'package:library_management_system/presentation/theme/theme_color.dart';
// import 'package:library_management_system/presentation/theme/theme_text.dart';
// import 'package:library_management_system/presentation/widget/app_touchable.dart';

// class EditBookScreen extends GetView<HomeController> {
//   final int index;
//   const EditBookScreen({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       resizeToAvoidBottomInset: true,
//       body: Obx(
//         () => Padding(
//           padding: EdgeInsets.only(
//             left: 16.sp,
//             right: 16.sp,
//             top: Get.mediaQuery.padding.top,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     child: Icon(
//                       Icons.arrow_back,
//                       color: AppColor.blue.shade700,
//                       size: 40.sp,
//                     ),
//                     onTap: () => Get.back(),
//                   ),
//                   SizedBox(
//                     width: 5.sp,
//                   ),
//                   Text(
//                     "Sửa tài liệu",
//                     style: AppTheme.heading2.copyWith(color: AppColor.blue.shade700),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10.sp,
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   reverse: true,
//                   child: Column(
//                     children: [
//                       textField(
//                           hintText: "Tên sách",
//                           controller: controller.nameBook,
//                           errorText: controller.validateNameBook.value,
//                           height: 45.sp),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               margin: EdgeInsets.only(right: 5.sp),
//                               child: textField(
//                                   hintText: "Tác giả",
//                                   controller: controller.authorBook,
//                                   errorText: controller.validateAuthorBook.value,
//                                   height: 45.sp),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 10.sp),
//                               child: textField(
//                                   hintText: "Id",
//                                   controller: controller.idBook,
//                                   errorText: controller.validateIdBook.value,
//                                   height: 45.sp),
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               margin: EdgeInsets.only(right: 5.sp, top: 10.sp),
//                               child: textField(
//                                   hintText: "Số tái bản",
//                                   controller: controller.reprintBook,
//                                   errorText: controller.validateReprintBook.value,
//                                   height: 45.sp),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               // margin: EdgeInsets.only(top: 10.sp),
//                               child: textField(
//                                   hintText: "Thể loại",
//                                   controller: controller.categoryBook,
//                                   errorText: controller.validateCategoryBook.value,
//                                   height: 45.sp),
//                             ),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 15.sp),
//                               child: textField(
//                                   hintText: "Ngày phát hành",
//                                   controller: controller.releaseDateBook,
//                                   errorText: controller.validateReleaseDateBook.value,
//                                   height: 45.sp),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               margin: EdgeInsets.only(right: 5.sp, top: 15.sp),
//                               child: textField(
//                                   hintText: "Số trang",
//                                   controller: controller.numberOfBook,
//                                   errorText: controller.validatePaperSizeBook.value,
//                                   height: 45.sp),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 15.sp),
//                               child: textField(
//                                   hintText: "Khổ giấy",
//                                   controller: controller.paperSizeBook,
//                                   errorText: controller.validatePaperSizeBook.value,
//                                   height: 45.sp),
//                             ),
//                           )
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 10.sp),
//                         child: textField(
//                             hintText: "Nhà xuất bản",
//                             controller: controller.publisherBook,
//                             errorText: controller.validatePublisherBook.value,
//                             height: 45.sp),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               margin: EdgeInsets.only(right: 5.sp),
//                               child: textField(
//                                   hintText: "Số phiên bản",
//                                   controller: controller.numberOfEditionsBook,
//                                   errorText: controller.validateNumberOfEditionBook.value,
//                                   height: 45.sp),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 10.sp),
//                               child: textField(
//                                   hintText: "Ngôn ngữ",
//                                   controller: controller.languageBook,
//                                   errorText: controller.validateLanguageBook.value,
//                                   height: 45.sp),
//                             ),
//                           )
//                         ],
//                       ),
//                       textField(
//                           hintText: "Link ảnh",
//                           controller: controller.imageBook,
//                           errorText: controller.validateImageBook.value,
//                           height: 45.sp),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 8,
//                             child: Container(
//                               margin: EdgeInsets.only(top: 15.sp),
//                               child: textField(
//                                   height: 45.sp,
//                                   hintText: "Ngày cập nhật",
//                                   controller: controller.updateDateBook,
//                                   errorText: controller.validateUpdateDateBook.value),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 10.sp),
//                         child: textField(
//                             hintText: "Mô tả",
//                             controller: controller.descriptionBook,
//                             errorText: controller.validateDescriptionBook.value,
//                             height: 100.sp),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: AppTouchable(
//         onPressed: () => _buttonAddDocument(context, index),
//         outlinedBorder:
//             RoundedRectangleBorder(side: BorderSide.none, borderRadius: BorderRadius.circular(AppDimens.space_20)),
//         backgroundColor: AppColor.blue.shade700,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 16.sp),
//         padding: EdgeInsets.symmetric(vertical: AppDimens.height_14),
//         child: Text('Thêm tài liệu',
//             style: AppTheme.textMBold.copyWith(
//               color: AppColor.blue.shade700,
//               fontSize: 14.sp,
//             )),
//       ),
//     );
//   }

//   Widget textField(
//       {required String hintText,
//       required TextEditingController controller,
//       required String? errorText,
//       required double height}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           hintText,
//           style: AppTheme.textMBold.copyWith(
//             color: AppColor.blue.shade700,
//             fontSize: 14.sp,
//           ),
//         ),
//         SizedBox(
//           height: 5.sp,
//         ),
//         Container(
//           height: height,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(
//               color: AppColor.blue.shade700,
//               width: 0.5,
//             ),
//           ),
//           child: Center(
//             child: TextFormField(
//               expands: true,
//               maxLines: null,
//               textAlign: TextAlign.center,
//               // inputFormatters: <TextInputFormatter>[
//               //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))
//               // ],
//               style: AppTheme.textM.copyWith(
//                 color: AppColor.blue.shade700,
//                 fontSize: 16.sp,
//               ),
//               // keyboardType: TextInputType.number,
//               controller: controller,
//               decoration: const InputDecoration(
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 5.sp,
//         ),
//         Text(
//           errorText ?? '',
//           style: AppTheme.text.copyWith(
//             color: AppColor.red,
//             fontSize: 10.sp,
//           ),
//         ),
//       ],
//     );
//   }

// //   _buttonAddDocument(BuildContext context, int index) async {
// //     await controller.addDocument(index);
// //   }
// }
