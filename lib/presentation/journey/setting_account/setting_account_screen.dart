import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/presentation/journey/setting_account/edit_user_screen.dart';
import 'package:library_management_system/presentation/journey/setting_account/setting_account_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class SettingAccountScreen extends GetView<SettingAccountController> {
  const SettingAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomIconButton(
          colorIcon: AppColor.black,
          isBorder: false,
          isDisable: false,
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Sửa hồ sơ",
          style: AppTheme.text.copyWith(
            fontSize: 20.sp,
            color: AppColor.black,
          ),
        ),
        actions: [
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Center(
                child: CustomTextButton(
                  isDisable: false,
                  textButton: 'Lưu',
                  onTap: controller.isSave.value
                      ? () async {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Cập nhật thành công'),
                              ),
                            );
                          }
                          await controller.updateData();
                          controller.isSave.value = false;
                          await controller.getData();
                        }
                      : null,
                  textColor: controller.isSave.value ? AppColor.black : AppColor.grey.shade500,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  controller.isSave.value = true;
                  controller.pickImageFromGallery();
                },
                child: Container(
                  height: 200.sp,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.blue.shade600,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.sp,
                      ),
                      SizedBox(
                        height: 150.sp,
                        width: 150.sp,
                        child: controller.imageUrl.value.trim().isNotEmpty
                            ? controller.displayImage.value.contains('/9j/')
                                ? CircleAvatar(
                                    backgroundImage: MemoryImage(
                                      base64Decode(controller.displayImage.value),
                                    ),
                                    radius: 20.sp,
                                  )
                                : CircleAvatar(
                                    backgroundImage: NetworkImage(controller.imageUrl.value),
                                    radius: 20.sp,
                                  )
                            : CircleAvatar(
                                radius: 35.sp,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  color: AppColor.blue.shade600,
                                  size: 120.sp,
                                ),
                              ),
                      ),
                      const Spacer(),
                      Container(
                        height: 20.sp,
                        color: Colors.black.withOpacity(0.5),
                        width: double.infinity.sp,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Thay đổi ảnh đại diện',
                          style: AppTheme.text.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _customSelectItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfoUser(
                        initValue: controller.name.value,
                        title: 'Tên',
                        onChanged: (p0) {
                          controller.name.value = p0;
                          controller.isSave.value = true;
                        },
                      ),
                    ),
                  );
                },
                title: 'Tên',
                content: controller.name.value,
              ),
              Divider(
                thickness: 0.5.sp,
                height: 1,
                color: AppColor.grey.shade400,
              ),
              _customSelectItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfoUser(
                        initValue: controller.address.value,
                        title: 'Địa Chỉ',
                        onChanged: (p0) {
                          controller.address.value = p0;
                          controller.isSave.value = true;
                        },
                      ),
                    ),
                  );
                },
                title: 'Địa chỉ',
                content: controller.address.value,
              ),
              SizedBox(
                height: 20.sp,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                color: Colors.white,
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) => Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Add your buttons here
                        Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoButton(
                                child: Text(
                                  'Cancel',
                                  style: AppTheme.text.copyWith(
                                    fontSize: 15,
                                    color: AppColor.black.shade500,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              CupertinoButton(
                                child: Text(
                                  'Done',
                                  style: AppTheme.text.copyWith(
                                    fontSize: 15,
                                    color: AppColor.black.shade500,
                                  ),
                                ),
                                onPressed: () async {
                                  controller.isSave.value = true;

                                  if (context.mounted) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        // Add your picker here
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).copyWith().size.height * 0.25,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 40,
                            onSelectedItemChanged: (value) {
                              String gender = 'Other';
                              if (value == 0) {
                                gender = 'Male';
                              } else if (value == 1) {
                                gender = 'Female';
                              } else {
                                gender = 'Other';
                              }
                              controller.gender.value = gender;
                            },
                            scrollController: FixedExtentScrollController(initialItem: 0),
                            children: [
                              Center(
                                child: Text(
                                  'Nam',
                                  style: AppTheme.text.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColor.black.shade500,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Nữ',
                                  style: AppTheme.text.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColor.black.shade500,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  'Khác',
                                  style: AppTheme.text.copyWith(
                                    fontSize: 18.sp,
                                    color: AppColor.black.shade500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giới tính',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColor.black.shade500,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                controller.gender.value == 'Female'
                                    ? 'Nữ'
                                    : controller.gender.value == 'Male'
                                        ? 'Nam'
                                        : 'Khác',
                                style: AppTheme.text.copyWith(
                                  fontSize: 15,
                                  color: AppColor.black.shade500,
                                ),
                              ),
                              SizedBox(
                                width: 5.sp,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColor.black.shade500,
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5.sp,
                height: 1,
                color: AppColor.grey.shade400,
              ),
              _customSelectItem(
                onTap: () {
                  controller.selectDatePicker(
                    address: controller.address.value,
                    context: context,
                    email: controller.email.value,
                    gender: controller.gender.value,
                    id: controller.uid.value,
                    imageUrl: controller.imageUrl.value,
                    name: controller.name.value,
                    phone: controller.phoneNumber.value,
                  );
                  controller.isSave.value = true;
                },
                title: 'Ngày sinh',
                content: controller.dateOfBirthController.value.toString().split(' ')[0],
              ),
              SizedBox(
                height: 20.sp,
              ),
              _customSelectItem(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditInfoUser(
                        initValue: controller.phoneNumber.value,
                        title: 'Số điện thoại',
                        onChanged: (p0) {
                          controller.phoneNumber.value = p0;
                          controller.isSave.value = true;
                        },
                      ),
                    ),
                  );
                },
                title: 'Điện thoại',
                content: controller.phoneNumber.value,
              ),
              Divider(
                thickness: 0.5.sp,
                height: 0.5.sp,
                color: AppColor.black.shade400,
              ),
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.sp,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.sp,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: AppTheme.text.copyWith(
                              fontSize: 15.sp,
                              color: AppColor.black.shade500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            controller.email.value,
                            style: AppTheme.text.copyWith(
                              fontSize: 15.sp,
                              color: AppColor.grey.shade500,
                            ),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _customSelectItem({
    String? title,
    String? content,
    required void Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 15.sp,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.sp,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title ?? '',
                    style: AppTheme.text.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.black.shade500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        content ?? '',
                        style: AppTheme.text.copyWith(
                          fontSize: 15.sp,
                          color: AppColor.black.shade500,
                        ),
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColor.black.shade500,
                        size: 15.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.sp,
            ),
          ],
        ),
      ),
    );
  }
}
