import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:library_management_system/common/constants/button.dart';
import 'package:library_management_system/common/constants/text_input.dart';
import 'package:library_management_system/presentation/journey/chat/chat_buble.dart';
import 'package:library_management_system/presentation/journey/chat/chat_controller.dart';
import 'package:library_management_system/presentation/theme/theme_color.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Chat App")),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(vertical: 16.sp),
            child: Column(
              children: [
                Expanded(
                  child: NotificationListener(
                    onNotification: (notification) {
                      if (notification is ScrollEndNotification) {
                        if (controller.scrollController.value.position.extentAfter == 0) {
                          controller.isScrolledToBottom.value = true;
                        } else {
                          controller.isScrolledToBottom.value = false;
                        }
                      }
                      return true;
                    },
                    child: StreamBuilder(
                      stream: controller.getMessages(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        var messages = snapshot.data?.docs;

                        return ListView.builder(
                          controller: controller.scrollController.value,
                          shrinkWrap: true,
                          itemCount: messages?.length,
                          itemBuilder: (context, index) {
                            var messageContent = messages?[index]['content'];
                            var timestamp = messages?[index]['timestamp']?.toDate() ?? DateTime.now();
                            var currentId = controller.getCurrentUser()?.uid;
                            var messageSenderId = messages?[index]['userId'] ?? '';
                            var name = messages?[index]['user'];
                            if (controller.isScrolledToBottom.value &&
                                controller.scrollController.value.position.hasViewportDimension) {
                              controller.scrollController.value.animateTo(
                                controller.scrollController.value.position.maxScrollExtent,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                            return ChatBubble(
                              name: name,
                              message: messageContent,
                              isMe: currentId == messageSenderId ? true : false,
                              avatarUrl: 'https://cdn.diemnhangroup.com/seoulcenter/2022/11/gai-xinh-1.jpg',
                              timestamp: timestamp ?? DateTime.now(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: CustomTextInput(
                          seffixIcon: CustomIconButton(
                              sizeIcon: 22.sp,
                              icon: Icons.send,
                              isBorder: false,
                              borderRadius: BorderRadius.circular(20.sp),
                              colorBorder: AppColor.blue.shade600,
                              shape: BoxShape.circle,
                              colorIcon: AppColor.blue.shade600,
                              onTap: () async {
                                var message = controller.textEditingController.value.text;
                                if (message.isNotEmpty) {
                                  controller.sendMessage(message);
                                  controller.textEditingController.value.clear();
                                }
                                if (controller.scrollController.value.hasClients &&
                                    controller.scrollController.value.position.hasViewportDimension) {
                                  controller.scrollController.value.animateTo(
                                    controller.scrollController.value.position.maxScrollExtent,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              isDisable: false),
                          colorBoder: AppColor.blue.shade600,
                          colorFocusBorder: AppColor.blue.shade600,
                          radius: 20.sp,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.sp,
                            vertical: 15.sp,
                          ),
                          isDisable: false,
                          controller: controller.textEditingController.value,
                          hintText: "Nhập tin nhắn",
                          hintStyle: AppTheme.text.copyWith(
                            fontSize: 14.sp,
                            color: AppColor.blue.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
