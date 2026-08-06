import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../state/chat_state.dart';

class ActiveUsersRow extends StatelessWidget {
  const ActiveUsersRow({super.key});

  final List<Map<String, dynamic>> users = const [
    {'name': 'M.Lorry', 'color': Color(0xFF90CAF9), 'online': true},
    {'name': 'Sara', 'color': Color(0xFFFFAB91), 'online': true},
    {'name': 'Silva', 'color': Color(0xFFA5D6A7), 'online': true},
    {'name': 'Any', 'color': Color(0xFFCE93D8), 'online': true},
    {'name': 'James', 'color': Color(0xFFFFCC80), 'online': false},
    {'name': 'Rita', 'color': Color(0xFF80DEEA), 'online': true},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: users.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                final chatState = context.read<ChatState>();
                chatState.toggleChatActive('story');
              },
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF7B5CF0),
                        width: 1.5,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF7B5CF0),
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Story',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            );
          }

          final user = users[index - 1];
          return GestureDetector(
            onTap: () {
              final chatState = context.read<ChatState>();
              chatState.selectChat(user['name'] as String);
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: user['color'] as Color,
                      child: Text(
                        (user['name'] as String)[0],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    if (user['online'] as bool)
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: const Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  user['name'] as String,
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}