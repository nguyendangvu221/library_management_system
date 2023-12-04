import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

// ignore: must_be_immutable
class CustomTextInput extends StatelessWidget {
  CustomTextInput({
    required this.isDisable,
    this.minLines,
    this.textInputAction,
    this.readOnly,
    this.controller,
    this.cursorColor,
    this.focusNode,
    this.colorBoder,
    this.colorFocusBorder,
    this.errorBorder,
    this.initValue,
    this.labelText,
    this.contentPadding,
    this.hintText,
    this.maxLength,
    this.maxLines,
    this.fillColor,
    this.obscureText,
    this.autofocus,
    this.autoValidate,
    this.autovalidateMode,
    this.align,
    this.textStyle,
    this.inputAction,
    this.inputType,
    this.formatter,
    this.validate,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.seffixIcon,
    this.prefixIcon,
    this.errorText,
    this.hintStyle,
    this.labelStyle,
    super.key,
  });
  TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? colorBoder;
  final Color? fillColor;
  final Color? colorFocusBorder;
  final Color? errorBorder;
  final String? initValue;
  final String? labelText;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final double? contentPadding;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autoValidate;
  final bool isDisable;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? align;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? formatter;
  final TextInputType? inputType;
  final String? Function(String?)? validate;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final Widget? seffixIcon;
  final Widget? prefixIcon;
  final String? errorText;
  final Color? cursorColor;
  final bool? readOnly;
  final int? minLines;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            textInputAction: textInputAction,
            cursorColor: cursorColor ?? AppColor.grey.shade300,
            controller: controller,
            style: textStyle,
            initialValue: initValue,
            validator: validate,
            textAlign: align ?? TextAlign.start,
            onChanged: isDisable ? null : onChanged,
            onEditingComplete: onEditingComplete,
            onFieldSubmitted: onSubmitted,
            obscureText: obscureText ?? false,
            readOnly: readOnly ?? false,
            inputFormatters: formatter,
            decoration: InputDecoration(
              fillColor: fillColor ?? Colors.transparent,
              contentPadding: EdgeInsets.all(contentPadding ?? 8.sp),
              labelText: labelText,
              hintText: hintText,
              labelStyle: labelStyle,
              hintStyle: hintStyle,
              suffixIcon: seffixIcon,
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorBoder ?? AppColor.blue.shade600, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorFocusBorder ?? AppColor.blue.shade600, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.red.shade400, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.blue.shade600, width: 1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
          // ignore: prefer_if_elements_to_conditional_expressions
          errorText == null
              ? const SizedBox.shrink()
              : Container(
                  height: 25.sp,
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 16.sp,
                  // ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    errorText ?? '',
                    style: AppTheme.text.copyWith(
                      color: AppColor.red.shade400,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
        ],
      );
}
