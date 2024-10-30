// message.dart
import 'package:intl/intl.dart';

class Message {
  final String senderName;
  final String senderAvatar;
  final String receiverName;
  final String receiverAvatar;
  final String? content;
  final List<String>? imageUrls;
  final String? videoUrl;
  final String? audioUrl;
  final DateTime timestamp;
  final bool isRead;
  final Message? replyTo;

  Message({
    required this.senderName,
    required this.senderAvatar,
    required this.receiverName,
    required this.receiverAvatar,
    this.content,
    this.imageUrls,
    this.videoUrl,
    this.audioUrl,
    required this.timestamp,
    this.isRead = false,
    this.replyTo,
  });

  Map<String, List<Message>> groupMessagesByDate(List<Message> messages) {
    final Map<String, List<Message>> groupedMessages = {};

    for (final message in messages) {
      final dateKey = DateFormat('dd/MM/yyyy').format(message.timestamp);

      if (groupedMessages[dateKey] == null) {
        groupedMessages[dateKey] = [];
      }
      groupedMessages[dateKey]!.add(message);
    }

    return groupedMessages;
  }
}
