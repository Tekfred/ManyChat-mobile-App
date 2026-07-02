import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.screenBackground,
    textTheme: GoogleFonts.poppinsTextTheme(),
    useMaterial3: true,
  );
}


