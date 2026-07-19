import 'package:flutter/material.dart';

class FloatingBubbles extends StatelessWidget {
  const FloatingBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // top left — pink bubble
        Positioned(
          top: 60,
          left: 20,
          child: _Bubble(
            color: const Color(0xFFF472B6),
            width: 55,
            height: 42,
            angle: -0.3,
          ),
        ),

        // top center left — orange arrow
        Positioned(
          top: 100,
          left: 80,
          child: _Bubble(
            color: const Color(0xFFFB923C),
            width: 60,
            height: 28,
            angle: 0.2,
            isArrow: true,
          ),
        ),

        // top right — green bubble
        Positioned(
          top: 55,
          right: 30,
          child: _Bubble(
            color: const Color(0xFF4ADE80),
            width: 52,
            height: 38,
            angle: 0.25,
          ),
        ),

        // mid left — yellow bubble
        Positioned(
          top: 160,
          left: 10,
          child: _Bubble(
            color: const Color(0xFFFACC15),
            width: 48,
            height: 36,
            angle: -0.15,
          ),
        ),

        // mid right — pink small
        Positioned(
          top: 180,
          right: 20,
          child: _Bubble(
            color: const Color(0xFFF9A8D4),
            width: 44,
            height: 32,
            angle: 0.3,
          ),
        ),

        // mid center — blue bubble
        Positioned(
          top: 220,
          left: 140,
          child: _Bubble(
            color: const Color(0xFF60A5FA),
            width: 50,
            height: 38,
            angle: -0.1,
          ),
        ),

        // lower left — orange bubble
        Positioned(
          top: 270,
          left: 30,
          child: _Bubble(
            color: const Color(0xFFFB923C),
            width: 46,
            height: 34,
            angle: 0.2,
          ),
        ),

        // lower right — green arrow
        Positioned(
          top: 260,
          right: 40,
          child: _Bubble(
            color: const Color(0xFF4ADE80),
            width: 58,
            height: 26,
            angle: -0.2,
            isArrow: true,
          ),
        ),
      ],
    );
  }
}

class _Bubble extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double angle;
  final bool isArrow;

  const _Bubble({
    required this.color,
    required this.width,
    required this.height,
    required this.angle,
    this.isArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: isArrow
              ? BorderRadius.circular(6)
              : BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}
