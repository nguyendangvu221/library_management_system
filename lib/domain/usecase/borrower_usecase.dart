import 'package:library_management_system/data/borrower_repository.dart';
import 'package:library_management_system/domain/models/borrower_model.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';

class BorrowerUsecase {
  final BorrowerRepository borrowerRepository;
  BorrowerUsecase(this.borrowerRepository);

  Future<void> addBorrower(HiveBorrower HiveBorrower) async {
    return await borrowerRepository.addBorrower(HiveBorrower);
  }

  Future<void> updateBorrower(HiveBorrower HiveBorrower, int index) async {
    return await borrowerRepository.updateBorrower(HiveBorrower, index);
  }

  Future<void> deleteBorrower(int index) async {
    return await borrowerRepository.deleteBorrower(index);
  }

  String? getCode(int index) {
    return borrowerRepository.getCode(index);
  }

  String? getName(int index) {
    return borrowerRepository.getName(index);
  }

  String? getEmail(int index) {
    return borrowerRepository.getEmail(index);
  }

  int getLength() {
    return borrowerRepository.getLength();
  }

  List<BorrowedDocument>? getBorrowedDocument(int index) {
    return borrowerRepository.getBorrowedDocument(index);
  }
}
