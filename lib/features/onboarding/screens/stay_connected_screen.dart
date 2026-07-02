import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class StayConnectedScreen extends StatelessWidget {
  const StayConnectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    final bodyStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Colors.white70,
    );

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(flex: 3),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      children: [
                        Text(
                          'Stay Connected,\nYour Way',
                          textAlign: TextAlign.center,
                          style: headlineStyle,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Experience seamless conversations\nlike never before.',
                          textAlign: TextAlign.center,
                          style: bodyStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Social icon row comes here
                  const Spacer(flex: 1),
                ],
              ),
            ),
            // Floating chat cards stack comes here
          ],
        ),
      ),
    );
  }
}
