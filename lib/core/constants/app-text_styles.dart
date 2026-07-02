import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle headline = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    height: 1.2,
  );

  static TextStyle bodyMuted = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white70,
    height: 1.4,
  );

  static TextStyle chatName = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static TextStyle chatMessage = GoogleFonts.poppins(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.black54,
  );
}
