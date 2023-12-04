import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';

class AppTouchable extends StatelessWidget {
  final Function()? onPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? rippleColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final OutlinedBorder? outlinedBorder;

  const AppTouchable(
      {Key? key,
      required this.onPressed,
      required this.child,
      this.width,
      this.height,
      this.backgroundColor,
      this.rippleColor,
      this.padding,
      this.margin,
      this.outlinedBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? AppColor.transparent),
          overlayColor: MaterialStateProperty.all(rippleColor ?? const Color.fromRGBO(204, 223, 242, 0.4)),
          shape: MaterialStateProperty.all(
            outlinedBorder ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.sp),
                ),
          ),
          padding: MaterialStateProperty.all(padding ?? EdgeInsets.zero),
          minimumSize: MaterialStateProperty.all(Size.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
        ),
        child: child ?? const SizedBox.shrink(),
      ),
    );
  }
}
