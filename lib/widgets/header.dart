import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 900;

    return Container(

      height: isMobile
          ? MediaQuery.of(context).size.height * 0.85
          : MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade50,
            Colors.purple.shade50,
          ],
        ),
      ),
      child: Center(
        child: Padding(
          padding: isMobile
              ? const EdgeInsets.all(16.0)
              : const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Profile Image
              Container(
                width: isMobile ? 150 : 200,
                height: isMobile ? 150 : 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/profile.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.blue.shade100,
                        child: Icon(
                          Icons.person,
                          size: isMobile ? 50 : 80,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 24 : 32),
              Text(
                'Matiullah Aziz',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                // textAlign: TextAlign.left,
              ),
              SizedBox(height: isMobile ? 12 : 16),
              Text(
                'Full Stack Developer & Software Engineer',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 24 : 32),
              isMobile
                  ? Column(
                children: [
                  _buildActionButton('Download CV', Icons.download, () {
                    // Add CV download functionality
                    launchUrl(Uri.parse("https://drive.google.com/file/d/1dG863MRz_w8T7FgCw9FU-qtV1CvOwfbH/view?usp=drive_link"));

                  }),
                  const SizedBox(height: 12),
                  _buildActionButton('Contact Me', Icons.email, () {
                    launchUrl(Uri.parse('mailto:azizmatiullah@yahoo.com'));
                  }),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildActionButton('Download CV', Icons.download, () {
                    // Add CV download functionality
                    launchUrl(Uri.parse("https://drive.google.com/file/d/1dG863MRz_w8T7FgCw9FU-qtV1CvOwfbH/view?usp=drive_link"));
                  }),
                  const SizedBox(width: 16),
                  _buildActionButton('Contact Me', Icons.email, () {
                    launchUrl(Uri.parse('mailto:azizmatiullah@yahoo.com'));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        minimumSize: const Size(160, 48), // Ensure good tap target
      ),
    );
  }
}