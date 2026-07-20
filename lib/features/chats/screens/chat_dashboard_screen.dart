import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/active_users_row.dart';
import '../widgets/message_list_tile.dart';

class ChatDashboardScreen extends StatelessWidget {
  const ChatDashboardScreen({super.key});

  final List<Map<String, dynamic>> messages = const [
    {
      'name': 'Theresa Webb',
      'message': 'Hi, how are you?',
      'time': '27 min',
      'color': Color(0xFF90CAF9),
      'unread': true,
    },
    {
      'name': 'Eleanor Pena',
      'message': 'Ok, let me check',
      'time': '31 min',
      'color': Color(0xFFFFAB91),
      'unread': false,
    },
    {
      'name': 'Marvin McKinney',
      'message': 'What are you doing?',
      'time': '2:13 PM',
      'color': Color(0xFFA5D6A7),
      'unread': false,
    },
    {
      'name': 'Arlene McCoy',
      'message': "I'm so excited for...",
      'time': 'Yesterday',
      'color': Color(0xFFCE93D8),
      'unread': false,
    },
    {
      'name': 'Bessie Cooper',
      'message': 'See you tomorrow!',
      'time': '14 Jan',
      'color': Color(0xFFFFCC80),
      'unread': false,
    },
    {
      'name': 'Jacob Jones',
      'message': 'Thanks a lot!',
      'time': '10 Jan',
      'color': Color(0xFF80DEEA),
      'unread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── TOP BAR ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  // Back button
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  // Title
                  Expanded(
                    child: Text(
                      'Message',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  // Three dots menu
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.more_horiz, color: Colors.black87),
                  ),
                ],
              ),
            ),

            // ── SEARCH BAR ────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 14),
                    Icon(Icons.search, color: Colors.grey.shade400),
                    const SizedBox(width: 10),
                    Text(
                      'Search People',
                      style: GoogleFonts.poppins(
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ── ACTIVE SECTION ────────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: Text(
                'Active',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),

            const ActiveUsersRow(),

            const SizedBox(height: 20),

            // ── MESSAGE SECTION ───────────────────────────────────
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8),
              child: Text(
                'Message',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),

            // Message list
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return MessageListTile(
                    name: msg['name'] as String,
                    lastMessage: msg['message'] as String,
                    time: msg['time'] as String,
                    avatarColor: msg['color'] as Color,
                    isUnread: msg['unread'] as bool,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // ── BOTTOM NAV BAR ─────────────────────────────────────────
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // chat tab active
        selectedItemColor: const Color(0xFF7B5CF0),
        unselectedItemColor: Colors.black38,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_rounded),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
