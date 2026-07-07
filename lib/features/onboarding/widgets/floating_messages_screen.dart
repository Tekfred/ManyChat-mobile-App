import 'package:flutter/material.dart';

class FloatingMessageScreen extends StatelessWidget {
  const FloatingMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.42,
      width: double.infinity,
      child: Image.asset(
        'assets/images/chat-state.png',
        fit: BoxFit.contain,
        alignment: Alignment.center,
      ),
    );
  }
}
