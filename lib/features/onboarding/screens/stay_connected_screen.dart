import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; 
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/social_icon_button.dart';
import '../widgets/floating_messages_screen.dart';
import '../widgets/mail_icon_badge.dart';
import '../../auth/screens/login_screen.dart'; 

class StayConnectedScreen extends StatelessWidget {
  const StayConnectedScreen({super.key});

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 32,
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
                        backgroundColor: Colors.white,
                        onTap: () => _launchURL('https://www.apple.com'),
                        child: const Icon(
                          Icons.apple,
                          color: Colors.black87,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      SocialIconButton(
                        backgroundColor: Colors.white,
                        onTap: () => _launchURL('https://www.google.com'),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/google.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SocialIconButton(
                        backgroundColor: const Color(0xFF7B5CF0),
                        onTap: () => _launchURL('https://discord.com'),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.asset(
                            'assets/images/discord-icon.png',
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SocialIconButton(
                        backgroundColor: Colors.white,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black87,
                          size: 30,
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
