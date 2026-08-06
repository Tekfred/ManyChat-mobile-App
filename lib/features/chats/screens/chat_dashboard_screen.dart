import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../state/chat_state.dart';
import '../widgets/active_users_row.dart';
import '../widgets/swipeable_chat_tile.dart';
import 'chat_detail_screen.dart';

class ChatDashboardScreen extends StatefulWidget {
  const ChatDashboardScreen({super.key});

  @override
  State<ChatDashboardScreen> createState() => _ChatDashboardScreenState();
}

class _ChatDashboardScreenState extends State<ChatDashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _activeController;
  late Animation<double> _activeAnimation;
  late AnimationController _messageController;
  late Animation<double> _messageAnimation;
  double _activeStretch = 0;
  double _messageStretch = 0;
  bool _isActiveDragging = false;
  bool _isMessageDragging = false;

  @override
  void initState() {
    super.initState();
    _activeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _activeAnimation = CurvedAnimation(
      parent: _activeController,
      curve: Curves.easeOutCubic,
    );
    _activeController.addListener(() {
      setState(() {
        _activeStretch = _activeAnimation.value * 60;
      });
    });

    _messageController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _messageAnimation = CurvedAnimation(
      parent: _messageController,
      curve: Curves.easeOutCubic,
    );
    _messageController.addListener(() {
      setState(() {
        _messageStretch = _messageAnimation.value * 60;
      });
    });
  }

  @override
  void dispose() {
    _activeController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _onActiveStretchStart() {
    _activeController.stop();
    setState(() {
      _isActiveDragging = true;
    });
  }

  void _onActiveStretchUpdate(double delta) {
    if (delta > 0) {
      setState(() {
        _activeStretch = delta * 0.3;
        if (_activeStretch > 60) _activeStretch = 60;
      });
    }
  }

  void _onActiveStretchEnd() {
    setState(() {
      _isActiveDragging = false;
    });
    if (_activeStretch > 0) {
      _activeController.reverse(from: _activeStretch / 60);
    }
  }

  void _onMessageStretchStart() {
    _messageController.stop();
    setState(() {
      _isMessageDragging = true;
    });
  }

  void _onMessageStretchUpdate(double delta) {
    if (delta > 0) {
      setState(() {
        _messageStretch = delta * 0.3;
        if (_messageStretch > 60) _messageStretch = 60;
      });
    }
  }

  void _onMessageStretchEnd() {
    setState(() {
      _isMessageDragging = false;
    });
    if (_messageStretch > 0) {
      _messageController.reverse(from: _messageStretch / 60);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── TOP BAR ─────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
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

              // ── SEARCH BAR ──────────────────────────────────
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

              // ── ACTIVE SECTION with stretch animation ───────
              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  if (notification is ScrollStartNotification &&
                      notification.metrics.pixels <= 0) {
                    _onActiveStretchStart();
                  }
                  if (notification is ScrollUpdateNotification) {
                    if (notification.metrics.pixels < 0) {
                      _onActiveStretchUpdate(-notification.metrics.pixels);
                    }
                  }
                  if (notification is ScrollEndNotification) {
                    _onActiveStretchEnd();
                  }
                  return false;
                },
                child: Transform.translate(
                  offset: Offset(0, _activeStretch * 0.5),
                  child: Transform.scale(
                    scale: 1.0 + (_activeStretch / 60) * 0.02,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        ActiveUsersRow(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),

              // ── MESSAGE SECTION header ──────────────────────
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

              // ── MESSAGE LIST with stretch animation ─────────
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification is ScrollStartNotification &&
                        notification.metrics.pixels <= 0) {
                      _onMessageStretchStart();
                    }
                    if (notification is ScrollUpdateNotification) {
                      if (notification.metrics.pixels < 0) {
                        _onMessageStretchUpdate(-notification.metrics.pixels);
                      }
                    }
                    if (notification is ScrollEndNotification) {
                      _onMessageStretchEnd();
                    }
                    return false;
                  },
                  child: Transform.translate(
                    offset: Offset(0, _messageStretch * 0.5),
                    child: Transform.scale(
                      scale: 1.0 + (_messageStretch / 60) * 0.02,
                      child: Consumer<ChatState>(
                        builder: (context, chatState, child) {
                          return ListView.builder(
                            itemCount: chatState.chats.length,
                            itemBuilder: (context, index) {
                              final chat = chatState.chats[index];
                              return SwipeableChatTile(
                                chat: chat,
                                onTap: () {
                                  chatState.selectChat(chat.id);
                                  chatState.markAsRead(chat.id);
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                          ChatDetailScreen(chat: chat),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        return SlideTransition(
                                          position: Tween<Offset>(
                                            begin: const Offset(1, 0),
                                            end: Offset.zero,
                                          ).animate(CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutCubic,
                                          )),
                                          child: child,
                                        );
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ── BOTTOM NAV BAR ─────────────────────────────────
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
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