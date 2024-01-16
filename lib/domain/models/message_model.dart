import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String? id;
  final String? content;
  final String? userId;
  final String? user;
  final String? avatar;
  final DateTime? timestamp;

  const Message({
    this.id,
    this.content,
    this.userId,
    this.user,
    this.avatar,
    this.timestamp,
  });
  factory Message.fromDocument(DocumentSnapshot doc) {
    return Message(
      id: doc.id,
      content: doc['content'] ?? '',
      userId: doc['userId'] ?? '',
      user: doc['user'] ?? '',
      avatar: doc['avatar'] ?? '',
      timestamp: doc['timestamp'].toDate() ?? DateTime.now(),
    );
  }
}
