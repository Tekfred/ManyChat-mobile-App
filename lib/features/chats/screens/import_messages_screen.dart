import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImportMessagesScreen extends StatelessWidget {
  final String chatName;

  const ImportMessagesScreen({super.key, required this.chatName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF7B5CF0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Import Messages',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Import messages from $chatName',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildImportOption(
                  icon: Icons.photo_outlined,
                  title: 'Import from Photos',
                  subtitle: 'Import media from your gallery',
                  onTap: () {},
                ),
                const Divider(height: 32),
                _buildImportOption(
                  icon: Icons.file_present_outlined,
                  title: 'Import from Files',
                  subtitle: 'Import documents and files',
                  onTap: () {},
                ),
                const Divider(height: 32),
                _buildImportOption(
                  icon: Icons.cloud_upload_outlined,
                  title: 'Import from Cloud',
                  subtitle: 'Sync messages from cloud storage',
                  onTap: () {},
                ),
                const Divider(height: 32),
                _buildImportOption(
                  icon: Icons.history_outlined,
                  title: 'Import from Backup',
                  subtitle: 'Restore from local backup',
                  onTap: () {},
                ),
                const Divider(height: 32),
                _buildImportOption(
                  icon: Icons.link_outlined,
                  title: 'Import from Link',
                  subtitle: 'Paste a message link to import',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImportOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF7B5CF0).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF7B5CF0), size: 24),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black38),
            ],
          ),
        ),
      ),
    );
  }
}