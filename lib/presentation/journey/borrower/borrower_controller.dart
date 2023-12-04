import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/models/user_model.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_view.dart';

class BorrowerController extends GetxController {
  BorrowerUsecase borrowerUsecase;
  BorrowerController({required this.borrowerUsecase});
  RxList<User> listUser = <User>[].obs;
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() async {
    listUser.value = await borrowerUsecase.fetchListUser();
    super.onInit();
  }

  void onRefresh() async {
    listUser.value = await borrowerUsecase.fetchListUser();
  }

  Future<List<User>> fetchListUser() {
    return borrowerUsecase.fetchListUser();
  }

  Future<void> deleteUserData(String id) async {
    await borrowerUsecase.deleteUserData(id);
    onRefresh();
  }

  Future<List<User>> searchUsers(String keyword) async {
    return borrowerUsecase.searchUsers(keyword);
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
          () => BorrowerView(
            user: listUser[index],
          ),
        );
      });
    };
  }
}
