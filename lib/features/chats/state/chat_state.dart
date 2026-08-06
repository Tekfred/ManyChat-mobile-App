import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/chat_item.dart';

class ChatState extends ChangeNotifier {
  final List<ChatItem> _chats;
  final List<Map<String, dynamic>> _importedMessages;

  ChatState()
      : _chats = [
          ChatItem(
            id: '1',
            name: 'Theresa Webb',
            lastMessage: 'Hi, how are you?',
            time: '27 min',
            avatarColor: const Color(0xFF90CAF9),
            isUnread: true,
            isActive: false,
            messages: [
              {'text': 'Hi, how are you?', 'sender': 'them', 'time': '27 min'},
              {'text': 'I am good, thanks!', 'sender': 'me', 'time': '25 min'},
              {'text': 'Want to meet up?', 'sender': 'them', 'time': '20 min'},
            ],
          ),
          ChatItem(
            id: '2',
            name: 'Eleanor Pena',
            lastMessage: 'Ok, let me check',
            time: '31 min',
            avatarColor: const Color(0xFFFFAB91),
            isUnread: false,
            isActive: false,
            messages: [
              {'text': 'Ok, let me check', 'sender': 'them', 'time': '31 min'},
              {'text': 'Sure take your time', 'sender': 'me', 'time': '30 min'},
            ],
          ),
          ChatItem(
            id: '3',
            name: 'Marvin McKinney',
            lastMessage: 'What are you doing?',
            time: '2:13 PM',
            avatarColor: const Color(0xFFA5D6A7),
            isUnread: false,
            isActive: false,
            messages: [
              {'text': 'What are you doing?', 'sender': 'them', 'time': '2:13 PM'},
              {'text': 'Nothing much, you?', 'sender': 'me', 'time': '2:10 PM'},
            ],
          ),
          ChatItem(
            id: '4',
            name: 'Arlene McCoy',
            lastMessage: "I'm so excited for...",
            time: 'Yesterday',
            avatarColor: const Color(0xFFCE93D8),
            isUnread: false,
            isActive: false,
            messages: [
              {'text': "I'm so excited for...", 'sender': 'them', 'time': 'Yesterday'},
            ],
          ),
          ChatItem(
            id: '5',
            name: 'Bessie Cooper',
            lastMessage: 'See you tomorrow!',
            time: '14 Jan',
            avatarColor: const Color(0xFFFFCC80),
            isUnread: false,
            isActive: false,
            messages: [
              {'text': 'See you tomorrow!', 'sender': 'them', 'time': '14 Jan'},
            ],
          ),
          ChatItem(
            id: '6',
            name: 'Jacob Jones',
            lastMessage: 'Thanks a lot!',
            time: '10 Jan',
            avatarColor: const Color(0xFF80DEEA),
            isUnread: false,
            isActive: false,
            messages: [
              {'text': 'Thanks a lot!', 'sender': 'them', 'time': '10 Jan'},
            ],
          ),
        ],
        _importedMessages = [
          {'name': 'Theresa Webb', 'message': 'Hi, how are you?', 'time': '27 min'},
          {'name': 'Eleanor Pena', 'message': 'Ok, let me check', 'time': '31 min'},
          {'name': 'Marvin McKinney', 'message': 'What are you doing?', 'time': '2:13 PM'},
          {'name': 'Arlene McCoy', 'message': "I'm so excited for...", 'time': 'Yesterday'},
          {'name': 'Bessie Cooper', 'message': 'See you tomorrow!', 'time': '14 Jan'},
          {'name': 'Jacob Jones', 'message': 'Thanks a lot!', 'time': '10 Jan'},
        ];

  List<ChatItem> get chats => List.unmodifiable(_chats);
  List<Map<String, dynamic>> get importedMessages => List.unmodifiable(_importedMessages);

  ChatItem? get activeChat => _chats.firstWhere((c) => c.isActive, orElse: () => _chats.first);

  void selectChat(String id) {
    for (var i = 0; i < _chats.length; i++) {
      _chats[i] = _chats[i].copyWith(isActive: _chats[i].id == id);
    }
    notifyListeners();
  }

  void toggleChatActive(String id) {
    final index = _chats.indexWhere((c) => c.id == id);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(isActive: !_chats[index].isActive);
      notifyListeners();
    }
  }

  void markAsRead(String id) {
    final index = _chats.indexWhere((c) => c.id == id);
    if (index != -1 && _chats[index].isUnread) {
      _chats[index] = _chats[index].copyWith(isUnread: false);
      notifyListeners();
    }
  }

  void updateLastMessage(String id, String message, String time) {
    final index = _chats.indexWhere((c) => c.id == id);
    if (index != -1) {
      _chats[index] = _chats[index].copyWith(
        lastMessage: message,
        time: time,
      );
      notifyListeners();
    }
  }
}