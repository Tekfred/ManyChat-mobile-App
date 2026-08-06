import 'package:flutter/material.dart';

class ChatItem {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;
  final bool isUnread;
  final bool isActive;
  final List<Map<String, dynamic>> messages;

  ChatItem({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    this.isUnread = false,
    this.isActive = false,
    this.messages = const [],
  });

  ChatItem copyWith({
    bool? isActive,
    bool? isUnread,
    String? lastMessage,
    String? time,
  }) {
    return ChatItem(
      id: id,
      name: name,
      lastMessage: lastMessage ?? this.lastMessage,
      time: time ?? this.time,
      avatarColor: avatarColor,
      isUnread: isUnread ?? this.isUnread,
      isActive: isActive ?? this.isActive,
      messages: messages,
    );
  }
}