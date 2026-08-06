import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/chat_item.dart';

class MessageListTile extends StatelessWidget {
  final ChatItem chat;
  final VoidCallback? onTap;

  const MessageListTile({
    super.key,
    required this.chat,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: chat.avatarColor,
              child: Text(
                chat.name[0],
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: chat.isUnread || chat.isActive
                          ? FontWeight.w700
                          : FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    chat.lastMessage,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: chat.isUnread
                          ? Colors.black87
                          : Colors.black45,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Text(
              chat.time,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.black38),
            ),
          ],
        ),
      ),
    );
  }
}