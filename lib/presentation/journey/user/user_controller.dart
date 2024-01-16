import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/domain/usecase/user_usecase.dart';

class UserController extends GetxController {
  UserUsecase userUsecase;
  UserController({required this.userUsecase});
  RxList<UserModel> listUser = <UserModel>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    listUser.value = await userUsecase.fetchListUser();
    super.onInit();
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

  RxString address = ''.obs;
  Rx<String?> dateOfBirthController = ''.obs;
  RxString email = ''.obs;
  RxString gender = ''.obs;
  RxString imageUrl = ''.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString uid = ''.obs;
  RxString displayImage = ''.obs;
  RxBool isSave = true.obs;

  Future<String> updateProfile() async {
    return await userUsecase.updateProfile(
      name: name.value,
      email: email.value,
      phoneNumber: phoneNumber.value,
      address: address.value,
      avatar: imageUrl.value,
      dateOfBirth: DateTime.parse(
        dateOfBirthController.value ?? DateTime.now().toString().split('')[0],
      ),
      gender: gender.value,
    );
  }

  bool validate() {
    bool validate = true;
    if (name.value.trim().isEmpty) {
      validate = false;
    } else if (imageUrl.value.trim().isEmpty) {
      validate = false;
    } else if (email.value.trim().isEmpty) {
      validate = false;
    } else if (phoneNumber.value.trim().isEmpty) {
      validate = false;
    } else if (dateOfBirthController.value?.trim().isEmpty ?? true) {
      validate = false;
    } else if (gender.value.trim().isEmpty) {
      validate = false;
    } else if (address.value.trim().isEmpty) {
      validate = false;
    }
    return validate;
  }

  Future<UserModel> getUserById(String id) async {
    return await userUsecase.getUserById(id);
  }

  Future<void> getData(String id) async {
    final UserModel user = await getUserById(id);
    name.value = user.name ?? '';
    email.value = user.email ?? '';
    phoneNumber.value = user.phoneNumber ?? '';
    address.value = user.address ?? '';
    imageUrl.value = user.avatar ?? '';
    dateOfBirthController.value = user.dateOfBirth.toString().split(' ')[0];
    gender.value = user.gender ?? '';
  }

  void onRefresh() async {
    listUser.value = await userUsecase.fetchListUser();
  }

  Future<List<UserModel>> fetchListUser() {
    return userUsecase.fetchListUser();
  }

  Future<void> deleteUserData(String id) async {
    await userUsecase.deleteUserData(id);
    onRefresh();
  }

  Future<List<UserModel>> searchUsers(String keyword) async {
    return userUsecase.searchUsers(keyword);
  }

  void onTapSearch() async {
    if (searchController.text.isEmpty) {
      onRefresh();
    } else {
      listUser.value = await searchUsers(searchController.text);
      searchController.clear();
    }
  }

  Future<String> uploadFileToFirebaseStorage(String filePath, String storagePath) async {
    return await userUsecase.uploadFileToFirebaseStorage(filePath, storagePath);
  }

  void clearData() {
    address.value = '';
    dateOfBirthController.value = '';
    email.value = '';
    gender.value = '';
    imageUrl.value = '';
    name.value = '';
    phoneNumber.value = '';
    uid.value = '';
    displayImage.value = '';
    isSave.value = true;
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
        DateTime.now().toString().split(' ')[0],
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

  Future<String?> addUserToFirestore({
    required String uid,
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String address,
    required DateTime dateOfBirth,
    required String gender,
    required String avatar,
  }) async {
    return await userUsecase.addUserToFirestore(
      uid: uid,
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      dateOfBirth: dateOfBirth,
      email: email,
      gender: gender,
      avatar: avatar,
    );
  }

  Future<String?> register() async {
    return await userUsecase.register(
      email: email.value,
      password: '123456',
      name: name.value,
      phoneNumber: phoneNumber.value,
      address: address.value,
      dateOfBirth: DateTime.parse(dateOfBirthController.value.toString().split(' ')[0]),
      gender: gender.value,
      avatar: imageUrl.value,
    );
  }
  // Function()? onTapDocument(int index) {
  //   return () {
  //     Future.delayed(const Duration(seconds: 1), () {
  //       Get.to(
  //         () => UserView(
  //           user: listUser[index],
  //         ),
  //       );
  //     });
  //   };
  // }
}
