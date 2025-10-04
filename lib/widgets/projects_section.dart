import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          const Text(
            'Featured Projects',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 48),
          _buildProjectsGrid(),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid() {
    final projects = [
      {
        'title': 'Storely App',
        'description': 'A full-featured mobile shopping application for electronics with payment integration and real-time inventory.',
        'technologies': ['Kotlin', 'Ktor', 'Posgtres'],
        'image': '💻',
      },
      {
        'title': 'The Feed',
        'description': 'A news app with realtime news from all over the world.',
        'technologies': ['Kotlin', 'News Api', 'Android'],
        'image': '📰',
      },
      {
        'title': 'MASA Learning Organization',
        'description': 'Interactive language learning platform for students and teachers with English courses,'
            ' progress tracking, and collaborative classrooms.',
        'technologies': ['Java/Kotlin', 'Android', 'RoomDB'],
        'image': '📚',
      },
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: projects.map((project) {
        return _buildProjectCard(
          project['title'] as String,
          project['description'] as String,
          project['technologies'] as List<String>,
          project['image'] as String,
        );
      }).toList(),
    );
  }

  Widget _buildProjectCard(String title, String description, List<String> technologies, String emoji) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 64),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildProjectButton('View Demo', Icons.visibility, () {
                      launchUrl(Uri.parse('https://example.com/demo'));
                    }),
                    const SizedBox(width: 12),
                    _buildProjectButton('GitHub', Icons.code, () {
                      launchUrl(Uri.parse('https://github.com/example'));
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectButton(String text, IconData icon, VoidCallback onPressed) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(text),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue.shade600,
        side: BorderSide(color: Colors.blue.shade600),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}