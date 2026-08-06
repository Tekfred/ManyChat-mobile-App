import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/chats/state/chat_state.dart';
import 'features/onboarding/screens/stay_connected_screen.dart';

class ManyChat extends StatelessWidget {
  const ManyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatState(),
      child: MaterialApp(
        title: 'ManyChat',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const StayConnectedScreen(),
      ),
    );
  }
}


