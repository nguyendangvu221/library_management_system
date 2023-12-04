import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/presentation/journey/register/register_screen2.dart';
import 'package:uuid/uuid.dart';

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
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
      await auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
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

  Future<void> addUser() {
    return usersCollection
        .add({
          'name': nameController.text,
          'phoneNumber': phoneNumberController.text,
          'address': addressController.text,
          'dateOfBirth': dateOfBirthController.text, // Sử dụng text của TextEditingController
          'email': emailController.text,
          'gender': gender.value, // Sử dụng value của RxString
          'role': 1,
          'imageUrl': 'a',
        })
        .then((value) => log("User Added"))
        .catchError((error) => log("Failed to add user: $error"));
  }
  // Future<void> addUser({
  //   required String name,
  //   required String email,
  //   required String phoneNumber,
  //   required DateTime dateOfBirth,
  //   required String address,
  //   required String gender,
  // }) async {
  //   try {
  //     String userId = const Uuid().v1(); // Đặt ID tùy ý của bạn
  //     await usersCollection.doc(userId).set({
  //       'name': name,
  //       'email': email,
  //       'phoneNumber': phoneNumber,
  //       'dateOfBirth': dateOfBirth,
  //       'address': address,
  //       'gender': gender,
  //       'role': 1,
  //       'userId': userId,
  //       'urlImage':
  //           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr7uUQCPN7lnbXiGu3yjuW82-8lVqCSlsQrg&usqp=CAU',
  //     });
  //   } catch (e) {
  //     print('Error adding user: $e');
  //   }
  // }

  // Hàm onRegister sử dụng hàm validate để kiểm tra và thực hiện đăng ký
  void onRegister2() async {
    if (validate2()) {
      await register1();
      await addUser();
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
