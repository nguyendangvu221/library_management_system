import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/presentation/journey/register/register_screen2.dart';

class RegisterController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');
  final registerFormKey = GlobalKey<FormState>();
  final dateOfBirthController = TextEditingController(
    text: DateTime(
      2000,
      01,
      01,
    ).toString().split(' ')[0],
  );

  DateTime? dateOfBirth = DateTime(
    2000,
    01,
    01,
  );
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;
  RxString gender = 'Male'.obs;
  RxString errorName = ''.obs;
  RxString errorEmail = ''.obs;
  RxString errorPassword = ''.obs;
  RxString errorConfirmPassword = ''.obs;
  RxString errorAddress = ''.obs;
  RxString errorPhoneNumber = ''.obs;

  Future<void> register1() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Lấy UID của người dùng vừa được tạo
      String uid = userCredential.user?.uid ?? "";

      // Thêm thông tin người dùng vào Firestore với UID
      await addUserToFirestore(uid);
      Get.snackbar('Success', 'Registered successfully');
      Get.offAllNamed(AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      // Xử lý các mã lỗi khác nhau khi đăng ký không thành công
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.');
      } else {
        // Xử lý các lỗi khác (nếu cần)
        Get.snackbar('Error', 'Registration failed. ${e.message}');
      }
    } catch (e) {
      // Xử lý lỗi chung (nếu cần)
      log(e.toString());
    }
  }

  Future<void> addUserToFirestore(String uid) {
    return usersCollection
        .doc(uid) // Sử dụng UID làm ID của tài liệu trong Firestore
        .set({
          'name': nameController.text,
          'phoneNumber': phoneNumberController.text,
          'address': addressController.text,
          'dateOfBirth': dateOfBirthController.text,
          'email': emailController.text,
          'gender': gender.value,
          'role': 1,
          'imageUrl': 'a',
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }

  bool validate1() {
    bool isValid = true;

    // Kiểm tra và đặt giá trị cho errorName
    if (nameController.text.isEmpty) {
      errorName.value = 'Tên không được để trống';
      isValid = false;
    } else {
      errorName.value = '';
    }

    // Kiểm tra và đặt giá trị cho errorEmail
    if (emailController.text.isEmpty) {
      errorEmail.value = 'Email không được để trống';
      isValid = false;
    } else {
      errorEmail.value = '';
    }

    // Kiểm tra và đặt giá trị cho errorPassword
    if (passwordController.text.isEmpty) {
      errorPassword.value = 'Password không được để trống';
      isValid = false;
    } else {
      errorPassword.value = '';
    }

    // Kiểm tra và đặt giá trị cho errorConfirmPassword
    if (confirmPasswordController.text.isEmpty) {
      errorConfirmPassword.value = 'Confirm Password không được để trống';
      isValid = false;
    } else if (confirmPasswordController.text != passwordController.text) {
      errorConfirmPassword.value = 'Confirm Password không khớp';
      isValid = false;
    } else {
      errorConfirmPassword.value = '';
    }

    // Kiểm tra và đặt giá trị cho các trường khác (nếu cần)

    return isValid;
  }

  bool validate2() {
    bool isValid = true;

    // Kiểm tra và đặt giá trị cho errorName
    if (phoneNumberController.text.isEmpty) {
      errorPhoneNumber.value = 'Số điện thoại không được để trống';
      isValid = false;
    } else {
      errorPhoneNumber.value = '';
    }

    // Kiểm tra và đặt giá trị cho errorEmail
    if (addressController.text.isEmpty) {
      errorAddress.value = 'Địa chỉ không được để trống';
      isValid = false;
    } else {
      errorAddress.value = '';
    }

    return isValid;
  }

  // Hàm onRegister sử dụng hàm validate để kiểm tra và thực hiện đăng ký
  void onRegister2() async {
    if (validate2()) {
      await register1();
    } else {
      return;
    }
  }

  void onRegister1() {
    if (validate1()) {
      Get.to(const RegisterScreen2());
    } else {
      return;
    }
  }

  void selectDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != dateOfBirth) {
      dateOfBirthController.text = DateTime(
        picked.year,
        picked.month,
        picked.day,
      ).toString().split(' ')[0];
    }
  }
}
