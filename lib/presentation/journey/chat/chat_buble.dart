import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:library_management_system/presentation/theme/theme_text.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String avatarUrl;
  final DateTime timestamp;
  final String? name;
  const ChatBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.avatarUrl,
    required this.timestamp,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.sp, horizontal: isMe ? 8.0.sp : 0.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe)
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 16.0,
            ),
          SizedBox(width: 8.0.sp),
          Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                name ?? '',
                style: AppTheme.textM.copyWith(
                  color: Colors.grey.shade700,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.0.sp),
              Container(
                padding: EdgeInsets.all(12.0.sp),
                decoration: BoxDecoration(
                  color: isMe ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12.sp,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 4.0.sp),
                    Text(
                      DateFormat('HH:mm dd/MM/yyyy').format(timestamp),
                      style: TextStyle(fontSize: 10.0.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 8.0.sp),
          if (isMe)
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 16.0,
            ),
        ],
      ),
    );
  }
}
