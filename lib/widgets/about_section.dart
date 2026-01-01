import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});


  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(

      padding: isMobile
          ? const EdgeInsets.symmetric(vertical: 40, horizontal: 16)
          : const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'About Me',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: isMobile ? 24 : 48),
          isMobile
              ? _buildMobileLayout()
              : _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Passionate Developer Creating Digital Experiences',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'I am a passionate and versatile Full-Stack Software Engineer with specialized expertise in building intelligent, end-to-end systems that integrate sophisticated AI with robust mobile and web platforms. My development core is powered by Python, Dart, Java and Kotlin, which I leverage to architect and implement solutions across the entire technology stack.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                _buildInfoItem('Location', 'Moscow, Russia'),
                _buildInfoItem('Email', 'azizmatiullah@yahoo.com'),
                _buildInfoItem('Phone', '+7 (968) 469-4873'),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLanguageItem('Persian', 'Native', 1.0),
                _buildLanguageItem('English', 'Fluent', 0.85),
                _buildLanguageItem('Russian', 'Intermediate', 0.8),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        const Text(
          'Passionate Developer Creating Digital Experiences',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: Colors.black87,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const Text(
          'I am a passionate and versatile Full-Stack Software Engineer with specialized expertise in building intelligent, '
              'end-to-end systems that integrate sophisticated AI with robust mobile and web platforms. '
              'My development core is powered by Python, Dart, Java and Kotlin, '
              'which I leverage to architect and implement solutions across the entire technology stack.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            height: 1.6,

          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 24),
        // _buildInfoItem('Location', 'Moscow, Russia'),
        // _buildInfoItem('Email', 'azizmatiullah@yahoo.com'),
        // _buildInfoItem('Phone', '+7 (968) 469-4873'),

        Align(
          alignment: Alignment.centerLeft,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoItem('Location', 'Moscow, Russia'),
            _buildInfoItem('Email', 'azizmatiullah@yahoo.com'),
            _buildInfoItem('Phone', '+7 (968) 469-4873'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Languages", style: TextStyle(
            fontSize:  28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          )),
              _buildLanguageItem('Persian/Dari', 'Native', 1.0),
              _buildLanguageItem('English', 'Fluent', 0.85),
              _buildLanguageItem('Russian', 'Intermediate', 0.8),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Padding(

      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageItem(String language, String level, double proficiency) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            language,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            level,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: proficiency,
            backgroundColor: Colors.grey.shade300,
            color: Colors.blue.shade600,
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      ),
    );
  }
}