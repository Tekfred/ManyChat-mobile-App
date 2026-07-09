import 'package:flutter/material.dart';

class FloatingMessageScreen extends StatefulWidget {
  const FloatingMessageScreen({super.key});

  @override
  State<FloatingMessageScreen> createState() => _FloatingMessageScreenState();
}



class _FloatingMessageScreenState extends State<FloatingMessageScreen> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

     return GestureDetector(
      // finger touches the image → expand
      onTapDown: (_) => setState(() => _isPressed = true),

      // finger lifts normally → shrink back
      onTapUp: (_) => setState(() => _isPressed = false),

      // finger slides off without lifting → also shrink back
      onTapCancel: () => setState(() => _isPressed = false),

      child: AnimatedScale(
        scale: _isPressed ? 1.08 : 1.0, // 1.0 = normal, 1.08 = 8% bigger
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: SizedBox(
          height: screenHeight * 0.42,
          width: double.infinity,
          child: Image.asset(
            'assets/images/chat-state.png',
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
