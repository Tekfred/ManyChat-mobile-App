import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/social_icon_button.dart';
import '../widgets/floating_messages_screen.dart';
import '../widgets/mail_icon_badge.dart';

class StayConnectedScreen extends StatelessWidget {
  const StayConnectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    final bodyStyle = Theme.of(
      context,
    ).textTheme.bodyMedium?.copyWith(color: Colors.white70);

    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      body: SafeArea(
        child: Stack(
          children: [
            // ── FLOATING CHAT CARDS PNG ─────────────────────────────
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: FloatingMessageScreen(),
            ),

            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(flex: 3),

                  // ── MAIL ICON + DASHED ARROW ──────────────────────
                  const MailIconBadge(),

                  const SizedBox(height: 24),

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

                  // ── SOCIAL ICON ROW ───────────────────────────────
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIconButton(
                        onTap: () {},
                        child: const Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SocialIconButton(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/google.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SocialIconButton(
                        backgroundColor: const Color(0xFF7B5CF0),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/discord_logo.png',
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SocialIconButton(
                        onTap: () {
                          // TODO: Navigator.pushNamed(context, '/login');
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 1),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
