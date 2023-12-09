import 'package:library_management_system/data/user_repository.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class UserUsecase {
  UserRepository userRepository;
  UserUsecase({required this.userRepository});
  Future<List<User>> fetchListUser() async {
    return await userRepository.fetchListUser();
  }

  Future<void> deleteUserData(String id) async {
    await userRepository.deleteUserData(id);
  }

  Future<List<User>> searchUsers(String keyword) async {
    return await userRepository.searchUsers(keyword);
  }
}
