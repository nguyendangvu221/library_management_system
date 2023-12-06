import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_dimens.dart';
import 'package:library_management_system/presentation/journey/add_book/add_book_screen.dart';
import 'package:library_management_system/presentation/journey/chat/chat_screen.dart';
import 'package:library_management_system/presentation/journey/home/home_screen.dart';
import 'package:library_management_system/presentation/journey/main/main_controller.dart';
import 'package:library_management_system/presentation/journey/search/search_screen.dart';
import 'package:library_management_system/presentation/journey/setting/setting_screen.dart';
import 'package:library_management_system/presentation/journey/user/user_screen.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';

import 'main_item.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({Key? key}) : super(key: key);

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: AppColor.grey.shade500,
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
        color: controller.rxCurrentNavIndex.value == index ? AppColor.blue.shade500 : AppColor.grey.shade500,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listScreenTab = [
      const HomeScreen(),
      const ChatScreen(),
      const UserScreen(),
      const AddBookScreen(),
      const SettingScreen(),
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Obx(() => IndexedStack(
            index: controller.rxCurrentNavIndex.value,
            children: listScreenTab,
          )),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
