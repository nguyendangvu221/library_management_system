import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/domain/usecase/setting_account_usecase.dart';

class SettingAccountController extends GetxController {
  SettingAccountUseCase settingAccountUseCase;

  SettingAccountController({required this.settingAccountUseCase});

  RxString address = ''.obs;
  Rx<String> dateOfBirthController = ''.obs;
  RxString email = ''.obs;
  RxString gender = ''.obs;
  RxString imageUrl = ''.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString uid = ''.obs;
  RxString displayImage = ''.obs;
  RxBool isSave = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  Future<void> updateData() async {
    await settingAccountUseCase.updateProfile(
      name: name.value,
      email: email.value,
      phoneNumber: phoneNumber.value,
      address: address.value,
      avatar: imageUrl.value,
      dateOfBirth: DateTime.parse(dateOfBirthController.value),
      gender: gender.value,
    );
  }

  Future<UserModel> getUserById() async {
    return await settingAccountUseCase.getUserById();
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageUrl.value = pickedFile.path;
      displayImage.value = pickedFile.path;
    }
    File imageFile = File(displayImage.value);
    Uint8List bytes = await imageFile.readAsBytes();
    String base64String = base64.encode(bytes);
    displayImage.value = base64String;
  }

  Future<void> getData() async {
    UserModel user = await getUserById();
    address.value = user.address ?? '';
    dateOfBirthController.value = user.dateOfBirth.toString().split(' ')[0];
    email.value = user.email ?? '';
    gender.value = user.gender ?? '';
    imageUrl.value = user.avatar ?? '';
    name.value = user.name ?? '';
    phoneNumber.value = user.phoneNumber ?? '';
    uid.value = user.id ?? '';
    log('imageUrl $imageUrl');
  }

  void selectDatePicker({
    required BuildContext context,
    required String name,
    required String address,
    required String phone,
    required String gender,
    required String imageUrl,
    required String email,
    required String id,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      confirmText: 'Lưu',
      cancelText: 'Hủy',
      initialDate: DateTime.parse(
        dateOfBirthController.value,
      ),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked.toString().split(' ')[0] != dateOfBirthController.value) {
      dateOfBirthController.value = DateTime(
        picked.year,
        picked.month,
        picked.day,
      ).toString().split(' ')[0];
      // if (context.mounted) {
      //   await
      // }
    }
  }
}
