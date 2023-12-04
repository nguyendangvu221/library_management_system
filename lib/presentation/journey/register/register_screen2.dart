import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/common/constants/app_routes.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/presentation/journey/register/register_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class RegisterScreen2 extends GetView<RegisterController> {
  const RegisterScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              CustomIconButton(
                isBorder: false,
                onTap: () {
                  Get.back();
                },
                isDisable: false,
                icon: Icons.arrow_back,
                sizeIcon: 30.sp,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Please complete the final step',
                  style: AppTheme.heading2.copyWith(color: AppColor.blue.shade700, fontSize: 24.sp),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'To be able to absorb more knowledge',
                  style: AppTheme.textM.copyWith(
                    color: AppColor.blue.shade700,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              _customTextInput(
                text: 'Số điện thoại',
                textInput: Obx(
                  () => CustomTextInput(
                    errorText: controller.errorPhoneNumber.value,
                    isDisable: false,
                    controller: controller.phoneNumberController,
                    fillColor: AppColor.white,
                  ),
                ),
              ),
              _customTextInput(
                text: 'Địa chỉ',
                textInput: Obx(
                  () => CustomTextInput(
                    errorText: controller.errorAddress.value,
                    controller: controller.addressController,
                    isDisable: false,
                    fillColor: AppColor.white,
                  ),
                ),
              ),
              _textInputDatePicker(
                onChanged: (p0) {
                  controller.dateOfBirth = controller.dateOfBirthController.text as DateTime?;
                },
                onTap: () {
                  controller.selectDatePicker(context);
                },
                controller: controller.dateOfBirthController,
              ),
              SizedBox(
                height: 20.sp,
              ),
              Obx(
                () => _customTextField(
                  text: 'Gender',
                  textInput: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _customRadioButton(
                        text: 'Male',
                        value: 'Male',
                        groupValue: controller.gender.value,
                        onChanged: (p0) {
                          controller.gender.value = p0 ?? '';
                        },
                      ),
                      _customRadioButton(
                        text: 'Female',
                        value: 'Female',
                        groupValue: controller.gender.value,
                        onChanged: (p0) {
                          controller.gender.value = p0 ?? '';
                        },
                      ),
                      _customRadioButton(
                        text: 'Other',
                        value: 'Other',
                        groupValue: controller.gender.value,
                        onChanged: (p0) {
                          controller.gender.value = p0 ?? '';
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomDefaultButton(
                isDisable: false,
                backgroundColor: AppColor.blue,
                isDisplayIcon: false,
                textButton: 'Register',
                onPressed: () {
                  controller.onRegister2();
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      textAlign: TextAlign.center,
                      style: AppTheme.text.copyWith(
                        color: AppColor.black,
                        fontSize: 14.sp,
                      )),
                  TextButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.login),
                    child: Text(
                      'Login up',
                      textAlign: TextAlign.center,
                      style: AppTheme.textMBold.copyWith(
                        color: AppColor.blue.shade700,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _customTextInput({
    required String text,
    required Widget textInput,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: AppTheme.textMReg.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        textInput,
      ],
    );
  }

  Widget _textInputDatePicker({
    String? errorText,
    required void Function(String?)? onChanged,
    required void Function()? onTap,
    required TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: AppTheme.text.copyWith(
            fontSize: 14.sp,
            color: AppColor.blue.shade700,
          ),
        ),
        SizedBox(
          height: 8.sp,
        ),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: CustomTextInput(
                controller: controller,
                onChanged: onChanged,
                readOnly: true,
                errorText: errorText,
                textStyle: AppTheme.textMReg.copyWith(
                  color: AppColor.grey.shade700,
                  fontSize: 14.sp,
                ),
                hintStyle: AppTheme.text.copyWith(
                  fontSize: 14.sp,
                  color: AppColor.grey.shade400,
                ),
                isDisable: false,
              ),
            ),
            Expanded(
              child: CustomIconButton(
                sizeIcon: 25.sp,
                isBorder: false,
                onTap: onTap,
                isDisable: false,
                icon: Icons.calendar_month_outlined,
                colorIcon: AppColor.blue.shade700,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _customTextField({required String text, required Widget textInput}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: AppTheme.text.copyWith(
              fontSize: 14.sp,
              color: AppColor.blue.shade700,
            ),
          ),
          SizedBox(
            height: 8.sp,
          ),
          textInput,
        ],
      );
  Widget _customRadioButton(
      {required String text,
      required String value,
      required String groupValue,
      required void Function(String?)? onChanged}) {
    return Row(
      children: [
        Radio(
          fillColor: MaterialStateProperty.all(AppColor.blue.shade700),
          visualDensity: VisualDensity.compact,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(
          text,
          style: AppTheme.textM.copyWith(
            color: AppColor.blue.shade700,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
