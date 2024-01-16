import 'package:library_management_system/data/user_repository.dart';
import 'package:library_management_system/domain/models/user_model.dart';

class UserUsecase {
  UserRepository userRepository;
  UserUsecase({required this.userRepository});
  Future<List<UserModel>> fetchListUser() async {
    return await userRepository.fetchListUser();
  }

  Future<void> deleteUserData(String id) async {
    await userRepository.deleteUserData(id);
  }

  Future<String?> addUserToFirestore({
    required String uid,
    required String email,
    required String name,
    required String phoneNumber,
    required String address,
    required DateTime dateOfBirth,
    required String gender,
    required String avatar,
  }) async {
    return await userRepository.addUserToFirestore(
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

  Future<String?> register({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String address,
    required DateTime dateOfBirth,
    required String gender,
    required String avatar,
  }) async {
    return await userRepository.register1(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
        dateOfBirth: dateOfBirth,
        gender: gender,
        avatar: avatar);
  }

  Future<String> updateProfile({
    required String name,
    required String email,
    required String phoneNumber,
    required String address,
    required String avatar,
    required String gender,
    required DateTime dateOfBirth,
  }) async {
    return await userRepository.updateProfile(
      address: address,
      avatar: avatar,
      dateOfBirth: dateOfBirth,
      email: email,
      gender: gender,
      name: name,
      phoneNumber: phoneNumber,
    );
  }

  Future<UserModel> getUserById(String id) {
    return userRepository.getUserById(id);
  }

  Future<String> uploadFileToFirebaseStorage(String filePath, String storagePath) async {
    return await userRepository.uploadFileToFirebaseStorage(filePath, storagePath);
  }

  Future<List<UserModel>> searchUsers(String keyword) async {
    return await userRepository.searchUsers(keyword);
  }
}
