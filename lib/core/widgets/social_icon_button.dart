import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final Color? backgroundColor;

  const SocialIconButton({
    super.key,
    required this.onTap,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: backgroundColor ?? const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Colors.white24,
            width: 1.5,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
