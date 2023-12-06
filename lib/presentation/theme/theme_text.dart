import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'theme_color.dart';

class AppTheme {
  /// Text style
  static const smallSpacing = 8.0;
  static const mainSpacing = 16.0;

  static const buttonXsHeight = 32.0;
  static const buttonSHeight = 40.0;
  static const buttonMHeight = 44.0;
  static const buttonLHeight = 48.0;
  static const buttonXLHeight = 56.0;

  static const mainRadius = BorderRadius.all(Radius.circular(12.0));
  static const buttonRadius = BorderRadius.all(Radius.circular(12.0));
  static const inputRadius = BorderRadius.all(Radius.circular(12.0));
  static const contentPadding = EdgeInsets.fromLTRB(mainSpacing, 24.0, mainSpacing, mainSpacing);
  static const contentHorizontalPadding = EdgeInsets.fromLTRB(mainSpacing, 0.0, mainSpacing, 0.0);

  static const appBarElevation = 0.0;
  static const bottomNavigationBarElevation = 0.0;

  static const pagePadding = EdgeInsets.all(mainSpacing);
  static const tilePadding = EdgeInsets.symmetric(horizontal: mainSpacing, vertical: 0);
  static const verticalPadding = EdgeInsets.symmetric(horizontal: 0, vertical: mainSpacing);

  static const dialogInsetPadding = EdgeInsets.all(36.0);
  static const dialogInnerPadding = EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0);
  static const cardInnerPadding = EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0);
  static const inputPadding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0);
  static BorderRadius dialogBorderRadius = BorderRadius.circular(24.0);

  static const productItemsInRow = 2;
  static const productGridSpacing = mainSpacing;
  static const productItemHeight = 227.0;
  static const imageSliderHeight = 380.0;
  static const homeCarouselHeight = 388.0;
  static const homeCarouselWidth = 349.0;
  static const homeTourItemWidth = 184.0;
  static const homeTourItemHeight = 103.0;
  static const homeIntroVideoHeight = 397.0;
  static const squareButtonSize = 56.0;
  static const starRatingWidth = 224.0;
  static const starRatingHeight = 32.0;

  static const heading = TextStyle(
    fontFamily: 'Montserrat',
    height: 1.3,
    color: AppColor.white,
  );

  static TextStyle heading1 = heading.copyWith(
    fontSize: 46.0.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading2 = heading.copyWith(
    fontSize: 40.0.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading3 = heading.copyWith(
    fontSize: 36.0.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading4 = heading.copyWith(
    fontSize: 32.0.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading5 = heading.copyWith(
    fontSize: 28.0.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle heading6 = heading.copyWith(
    fontSize: 24.0.sp,
    fontWeight: FontWeight.w700,
  );

  // Content text
  static const text = TextStyle(
    fontFamily: 'Inter',
    color: AppColor.white,
  );

  static TextStyle textM = text.copyWith(
    fontSize: 16.0.sp,
    height: 1.25,
  );

  static TextStyle textMReg = textM.copyWith(
    fontWeight: FontWeight.w400,
  );

  static TextStyle textMSemiBold = text.copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle textMBold = textM.copyWith(
    fontWeight: FontWeight.w700,
  );

  static TextStyle footnote = text.copyWith(
    fontSize: 13.0,
    height: 1.4,
  );
}
