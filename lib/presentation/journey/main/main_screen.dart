import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_dimens.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_screen.dart';
import 'package:library_management_system/presentation/journey/borrower/Borrower_screen.dart';
import 'package:library_management_system/presentation/journey/home/home_screen.dart';
import 'package:library_management_system/presentation/journey/main/main_controller.dart';
import 'package:library_management_system/presentation/journey/search/search_screen.dart';
import 'package:library_management_system/presentation/journey/user/user_screen.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';

import 'main_item.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: AppColors.charade.withOpacity(0.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.sp,
            vertical: 8.sp,
          ),
          child: Row(
            children: List.generate(
              MainItem.values.length,
              (index) {
                return Expanded(
                  flex: 1,
                  child: Obx(
                    () => navBarItem(
                      context,
                      index,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget navBarItem(
    BuildContext context,
    int index,
  ) {
    final mainItem = MainItem.values.elementAt(index);

    return IconButton(
      splashRadius: AppDimens.space_12,
      onPressed: () async => await controller.onChangedNav(index),
      icon: Icon(
        mainItem.getIcon(),
        color: controller.rxCurrentNavIndex.value == index
            ? AppColors.blue500
            : AppColors.charade,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listScreenTab = [
      const HomeScreen(),
      const SearchScreen(),
      const BorrowerScreen(),
      const AddBookScreen(),
      const UserScreen(),
    ];
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() => IndexedStack(
            index: controller.rxCurrentNavIndex.value,
            children: listScreenTab,
          )),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
