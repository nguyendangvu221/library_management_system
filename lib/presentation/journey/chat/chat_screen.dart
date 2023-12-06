import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:library_management_system/presentation/journey/chat/chat_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.sp,
          ),
          child: Column(
            children: [
              Text(
                "Chat chung",
                style: AppTheme.heading2.copyWith(
                  color: AppColor.blue.shade600,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
