import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_management_system/common/ultils/app_screen_utils/flutter_screenutils.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({
    this.heightButton,
    this.widthButton,
    this.borderColor,
    this.iconButton,
    this.sizeIcon,
    this.foregroundColor,
    this.radius,
    this.colorData,
    this.backgroundColor,
    this.isDisplayIcon,
    this.isBorder,
    this.onPressed,
    this.isDisable,
    this.iconAtFirst,
    this.textStyle,
    required this.textButton,
    super.key,
  });
  final bool? isDisplayIcon;
  final bool? isBorder;
  final double? radius;
  final double? sizeIcon;
  final bool? iconAtFirst;
  final double? heightButton;
  final double? widthButton;
  final Widget? iconButton;
  final String textButton;
  final Color? colorData;
  final bool? isDisable;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) => SizedBox(
        height: heightButton ?? AppTheme.buttonSHeight,
        width: widthButton ?? double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: isDisable ?? false ? AppColor.grey.shade300 : backgroundColor ?? Colors.transparent,
            foregroundColor: foregroundColor ?? Colors.white,
            side: isBorder ?? false
                ? BorderSide(width: 1.0, color: borderColor ?? AppColor.blue.shade600)
                : BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 20.sp),
            ),
            alignment: Alignment.center,
          ),
          onPressed: isDisable ?? false ? null : onPressed,
          child: customIntoButton(
            isDisplayIcon ?? false,
            colorData ?? Colors.white,
            iconAtFirst ?? false,
            iconButton,
            sizeIcon,
            textButton,
            textStyle,
          ),
        ),
      );
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    this.splashRadius,
    this.colorBorder,
    this.colorFill,
    this.size,
    this.colorIcon,
    this.sizeIcon,
    this.iconSVG,
    required this.isBorder,
    required this.onTap,
    required this.isDisable,
    this.icon,
    super.key,
  });
  final double? splashRadius;
  final bool isBorder;
  final Color? colorIcon;
  final double? size;
  final bool isDisable;
  final Color? colorBorder;
  final Color? colorFill;
  final Widget? iconSVG;
  final IconData? icon;
  final void Function()? onTap;
  final double? sizeIcon;
  @override
  Widget build(BuildContext context) => ClipRect(
        child: isBorder
            ? DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDisable ? Colors.transparent : colorFill ?? Colors.transparent,
                  border: Border.all(
                    color: isDisable ? AppColor.grey.shade400 : colorBorder ?? Colors.transparent,
                    width: 2.sp,
                  ),
                ),
                child: GestureDetector(
                  onTap: isDisable ? null : onTap,
                  child: iconSVG ??
                      Icon(
                        size: sizeIcon,
                        icon,
                        color: isDisable ? AppColor.grey.shade400 : colorIcon ?? AppColor.blue.shade600,
                      ),
                ),
              )
            : GestureDetector(
                onTap: isDisable ? null : onTap,
                child: iconSVG ??
                    Icon(
                      size: sizeIcon,
                      icon,
                      color: isDisable ? AppColor.grey.shade400 : colorIcon ?? AppColor.blue.shade600,
                    ),
              ),
      );
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.textButton,
    required this.onTap,
    required this.isDisable,
    this.textColor,
    this.fontSize,
    super.key,
  });
  final Color? textColor;
  final bool isDisable;
  final String textButton;
  final double? fontSize;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: isDisable ? null : onTap,
        child: Text(
          textButton,
          style: AppTheme.text.copyWith(
            color: textColor ?? AppColor.black,
            fontWeight: FontWeight.w400,
            fontSize: fontSize ?? 16.sp,
          ),
        ),
      );
}

Widget customIntoButton(
  bool isDisplayIcon,
  Color? colorData,
  bool iconAtFirst,
  Widget? iconButton,
  double? sizeIcon,
  String textButton,
  TextStyle? textStyle,
) =>
    iconAtFirst
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_if_elements_to_conditional_expressions
              isDisplayIcon ? iconButton ?? Container() : Container(),
              // ignore: prefer_if_elements_to_conditional_expressions
              isDisplayIcon
                  ? const SizedBox(
                      width: AppTheme.smallSpacing,
                    )
                  : Container(),
              Text(
                textButton,
                style: AppTheme.text.copyWith(
                  color: colorData,
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textButton,
                style: textStyle ??
                    AppTheme.text.copyWith(
                      color: colorData,
                    ),
              ),
              // ignore: prefer_if_elements_to_conditional_expressions
              isDisplayIcon
                  ? const SizedBox(
                      width: AppTheme.smallSpacing,
                    )
                  : Container(),
              // ignore: prefer_if_elements_to_conditional_expressions
              isDisplayIcon ? iconButton ?? Container() : Container(),
            ],
          );
