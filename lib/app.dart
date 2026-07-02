import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/screens/stay_connected_screen.dart';

class ManyChat extends StatelessWidget {
  const ManyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ManyChat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const StayConnectedScreen(),
    );
  }
}


