import 'package:get/get.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/usecase/borrower_usecase.dart';
import 'package:library_management_system/presentation/journey/borrower/borrower_view.dart';

class BorrowerController extends GetxController {
  BorrowerUsecase borrowerUsecase;
  BorrowerController({required this.borrowerUsecase});
  RxList<HiveBorrower> listBorrower = <HiveBorrower>[].obs;

  void onInit() {
    super.onInit();
    addLocalData();
  }

  Function()? onTapDocument(int index) {
    return () {
      Future.delayed(const Duration(seconds: 1), () {
        Get.to(
          () => BorrowerView(
            borrower: listBorrower[index],
          ),
        );
      });
    };
  }

  void delBorrower(int index) {
    borrowerUsecase.deleteBorrower(index);
    addLocalData();
  }

  void addLocalData() {
    listBorrower.value = borrowerUsecase.getAllListBorrower();
  }
}
