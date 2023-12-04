import 'package:library_management_system/data/borrower_repository.dart';
import 'package:library_management_system/domain/models/hive_borrowed_document.dart';
import 'package:library_management_system/domain/models/hive_borrower.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class BorrowerUsecase {
  final BorrowerRepository borrowerRepository;
  BorrowerUsecase(this.borrowerRepository);
  Future<List<User>> fetchListUser() {
    return borrowerRepository.fetchListUser();
  }

  Future<void> deleteUserData(String id) async {
    await borrowerRepository.deleteUserData(id);
  }

  Future<List<User>> searchUsers(String keyword) async {
    return borrowerRepository.searchUsers(keyword);
  }
}
