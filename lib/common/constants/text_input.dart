import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    required this.isDisable,
    this.textInputAction,
    this.controller,
    this.onTapForgotPassword,
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
    this.isForgetPassword,
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
    this.readOnly,
    this.filled,
    this.isDense,
    this.onTap,
    this.minHeight,
    this.minWidth,
    this.minLines,
    this.customHintext,
    this.radius,
    super.key,
  });
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? colorBoder;
  final double? radius;
  final Color? fillColor;
  final Color? colorFocusBorder;
  final Color? errorBorder;
  final String? initValue;
  final String? labelText;
  final String? hintText;
  final bool? isForgetPassword;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
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
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final bool? filled;
  final bool? customHintext;
  final double? minHeight;
  final double? minWidth;
  final bool? isDense;
  final void Function()? onTap;
  final void Function()? onTapForgotPassword;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextFormField(
            onFieldSubmitted: onSubmitted,
            initialValue: initValue,
            onTap: onTap,
            readOnly: readOnly ?? false,
            textInputAction: textInputAction,
            cursorColor: cursorColor ?? AppColor.grey.shade300,
            controller: controller,
            style: textStyle,
            textAlign: align ?? TextAlign.start,
            onChanged: isDisable ? null : onChanged,
            keyboardType: inputType ?? TextInputType.text,
            onEditingComplete: onEditingComplete,
            obscureText: obscureText ?? false,
            maxLines: maxLines ?? 1,
            minLines: minLines ?? 1,
            inputFormatters: formatter,
            decoration: InputDecoration(
              suffixIconConstraints: BoxConstraints(
                minHeight: minHeight ?? 30.sp,
                minWidth: minWidth ?? 40.sp,
              ),
              isDense: isDense,
              filled: filled,
              fillColor: fillColor ?? Colors.transparent,
              contentPadding: contentPadding,
              labelText: labelText,
              hintText: hintText,
              labelStyle: labelStyle,
              hintStyle: hintStyle,
              suffixIcon: seffixIcon,
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorBoder ?? AppColor.grey.shade500, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: colorFocusBorder ?? AppColor.grey.shade500, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 5),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.red.shade400, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 5),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.grey.shade500, width: 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(radius ?? 5),
                ),
              ),
            ),
          ),
          // ignore: prefer_if_elements_to_conditional_expressions
          errorText == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    isForgetPassword ?? false
                        ? CustomTextButton(
                            textColor: AppColor.blue.shade700,
                            textButton: 'Quên mật khẩu',
                            onTap: onTapForgotPassword,
                            textStyle: AppTheme.textMSemiBold.copyWith(
                              color: AppColor.blue.shade700,
                              fontSize: 14.sp,
                            ),
                            isDisable: false,
                          )
                        : Container(),
                  ],
                )
              : Container(
                  height: 25.sp,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        errorText ?? '',
                        style: AppTheme.text.copyWith(
                          color: AppColor.red.shade400,
                          fontSize: 12.sp,
                        ),
                      ),
                      isForgetPassword ?? false
                          ? CustomTextButton(
                              textColor: AppColor.blue.shade700,
                              textButton: 'Quên mật khẩu',
                              onTap: onTapForgotPassword,
                              isDisable: false,
                              textStyle: AppTheme.textMSemiBold.copyWith(
                                color: AppColor.blue.shade700,
                                fontSize: 14.sp,
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
        ],
      );
}
