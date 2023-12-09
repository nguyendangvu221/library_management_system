// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:library_management_system/common/constants/app_dimens.dart';

// import 'theme_color.dart';

// ThemeData get appTheme {
//   return ThemeData(
//     fontFamily: 'GoogleSF',
//     primaryColor: AppColors.primary,
//     buttonTheme: ButtonThemeData(
//       buttonColor: AppColors.primary,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppDimens.radius_12),
//       ),
//     ),
//     scaffoldBackgroundColor: AppColors.background,
//     appBarTheme: AppBarTheme(color: AppColors.background, elevation: 0.0),
//     textSelectionTheme:
//         const TextSelectionThemeData(cursorColor: AppColors.primary),
//     cupertinoOverrideTheme: CupertinoThemeData(
//       textTheme: CupertinoTextThemeData(
//         dateTimePickerTextStyle: TextStyle(
//           color: AppColors.blue900,
//           fontSize: 22.sp,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     ),
//     checkboxTheme: CheckboxThemeData(
//       fillColor: MaterialStateProperty.resolveWith<Color?>(
//           (Set<MaterialState> states) {
//         if (states.contains(MaterialState.disabled)) {
//           return null;
//         }
//         if (states.contains(MaterialState.selected)) {
//           return AppColors.primary;
//         }
//         return null;
//       }),
//     ),
//     radioTheme: RadioThemeData(
//       fillColor: MaterialStateProperty.resolveWith<Color?>(
//           (Set<MaterialState> states) {
//         if (states.contains(MaterialState.disabled)) {
//           return null;
//         }
//         if (states.contains(MaterialState.selected)) {
//           return AppColors.primary;
//         }
//         return null;
//       }),
//     ),
//     switchTheme: SwitchThemeData(
//       thumbColor: MaterialStateProperty.resolveWith<Color?>(
//           (Set<MaterialState> states) {
//         if (states.contains(MaterialState.disabled)) {
//           return null;
//         }
//         if (states.contains(MaterialState.selected)) {
//           return AppColors.primary;
//         }
//         return null;
//       }),
//       trackColor: MaterialStateProperty.resolveWith<Color?>(
//           (Set<MaterialState> states) {
//         if (states.contains(MaterialState.disabled)) {
//           return null;
//         }
//         if (states.contains(MaterialState.selected)) {
//           return AppColors.primary;
//         }
//         return null;
//       }),
//     ),
//   );
// }
