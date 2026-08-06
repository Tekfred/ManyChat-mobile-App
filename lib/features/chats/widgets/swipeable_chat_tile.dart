import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/chat_item.dart';
import '../screens/import_messages_screen.dart';

class SwipeableChatTile extends StatefulWidget {
  final ChatItem chat;
  final VoidCallback? onTap;

  const SwipeableChatTile({
    super.key,
    required this.chat,
    this.onTap,
  });

  @override
  State<SwipeableChatTile> createState() => _SwipeableChatTileState();
}

class _SwipeableChatTileState extends State<SwipeableChatTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _revealController;
  late Animation<double> _revealAnimation;
  double _dragPosition = 0;
  bool _isRevealed = false;

  static const double _revealThreshold = 100;
  static const double _maxReveal = 140;

  @override
  void initState() {
    super.initState();
    _revealController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _revealAnimation = CurvedAnimation(
      parent: _revealController,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _revealController.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.primaryDelta ?? 0;
      if (_dragPosition < 0) _dragPosition = 0;
      if (_dragPosition > _maxReveal) _dragPosition = _maxReveal;
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final shouldReveal = _dragPosition > _revealThreshold / 2;
    setState(() {
      _isRevealed = shouldReveal;
    });
    if (shouldReveal) {
      _revealController.forward();
    } else {
      _revealController.reverse();
    }
    _dragPosition = shouldReveal ? _maxReveal : 0;
  }

  void _onTap() {
    if (_isRevealed) {
      setState(() {
        _isRevealed = false;
      });
      _revealController.reverse();
      _dragPosition = 0;
      return;
    }
    widget.onTap?.call();
  }

  void _onImportTap() {
    _revealController.reverse();
    _dragPosition = 0;
    setState(() {
      _isRevealed = false;
    });
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ImportMessagesScreen(chatName: widget.chat.name),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
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
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Stack(
        children: [
          // ── REVEAL ACTION (Import Messages) ──
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: _onImportTap,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    width: _maxReveal,
                    height: 72,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B5CF0),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.import_export, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Import',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ── MAIN TILE ──
          Transform.translate(
            offset: Offset(_dragPosition, 0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _onTap,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: widget.chat.isActive
                        ? const Color(0xFFF3EFFE)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: widget.chat.avatarColor,
                        child: Text(
                          widget.chat.name[0],
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
                              widget.chat.name,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight:
                                    widget.chat.isUnread || widget.chat.isActive
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              widget.chat.lastMessage,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: widget.chat.isUnread
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
                        widget.chat.time,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}