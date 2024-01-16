import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class EditInfoUser extends StatelessWidget {
  const EditInfoUser({
    super.key,
    required this.title,
    required this.initValue,
    required this.onChanged,
  });
  final String title;
  final String initValue;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey.shade200,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: CustomIconButton(
          colorIcon: AppColor.blue.shade600,
          isBorder: false,
          isDisable: false,
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sửa $title',
          style: AppTheme.text.copyWith(
            fontSize: 20.sp,
            color: AppColor.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: Center(
              child: CustomTextButton(
                textButton: 'Lưu',
                onTap: () {
                  Navigator.pop(context);
                },
                textColor: AppColor.blue.shade600,
                isDisable: false,
              ),
            ),
          ),
        ],
      ),
      body: CustomTextInput(
        onChanged: onChanged,
        filled: true,
        fillColor: Colors.white,
        isDisable: false,
        isDense: true,
        colorBoder: Colors.transparent,
        colorFocusBorder: Colors.transparent,
        initValue: initValue,
        textStyle: AppTheme.text.copyWith(
          fontSize: 15.sp,
          color: AppColor.black,
        ),
      ),
    );
  }
}
