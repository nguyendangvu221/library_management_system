import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/domain/usecase/user_usecase.dart';
import 'package:library_management_system/presentation/journey/user/user_view.dart';

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

  Function()? onTapDocument(int index) {
    return () {
      Future.delayed(const Duration(seconds: 1), () {
        Get.to(
          () => UserView(
            user: listUser[index],
          ),
        );
      });
    };
  }
}
