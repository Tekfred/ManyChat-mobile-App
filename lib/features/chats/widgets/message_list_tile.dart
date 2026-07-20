import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageListTile extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final Color avatarColor;
  final bool isUnread;

  const MessageListTile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarColor,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 28,
            backgroundColor: avatarColor,
            child: Text(
              name[0],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Name + message
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: isUnread ? FontWeight.w700 : FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  lastMessage,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Time
          Text(
            time,
            style: GoogleFonts.poppins(fontSize: 12, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
