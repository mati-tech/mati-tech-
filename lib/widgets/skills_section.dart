import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Skills & Technologies',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 48),
          _buildSkillsGrid(),
        ],
      ),
    );
  }

  Widget _buildSkillsGrid() {
    final skills = [
      {'name': 'Flutter(Dart)', 'level': 95, 'category': 'Mobile/Web'},
      {'name': 'Android(Kotlin/Java)', 'level': 90, 'category': 'Mobile'},
      {'name': 'Java', 'level': 90, 'category': 'Programming/Backend'},
      {'name': 'Kotlin', 'level': 90, 'category': 'Programming/Backend'},
      {'name': 'Ktor/SpringBoot', 'level': 90, 'category': 'Backend'},
      {'name': 'Git', 'level': 95, 'category': 'Tools'},
      {'name': 'Python', 'level': 90, 'category': 'Programming'},
      {'name': 'C++', 'level': 85, 'category': 'Programming'},
      {'name': 'UI/UX Design', 'level': 89, 'category': 'Design/Figma'},
      {'name': 'Postgres', 'level': 95, 'category': 'Database/SQL'},
      {'name': 'Mysql', 'level': 90, 'category': 'Database/SQL'},
      {'name': 'FastApi', 'level': 95, 'category': 'Backend'},
      {'name': 'Docker', 'level': 89, 'category': 'DevOps'},
      {'name': 'CI/CD', 'level': 92, 'category': 'DevOps'},
      {'name': 'Cassandra/Mongodb', 'level': 90, 'category': 'NoSQL'},

    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: skills.map((skill) {
        return _buildSkillCard(
          skill['name'] as String,
          (skill['level'] as int).toDouble(),
          skill['category'] as String,
        );
      }).toList(),
    );
  }

  Widget _buildSkillCard(String name, double level, String category) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          LinearProgressIndicator(
            value: level / 100,
            backgroundColor: Colors.grey.shade300,
            color: _getSkillColor(level),
            minHeight: 8,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 8),
          Text(
            '${level.toInt()}%',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Color _getSkillColor(double level) {
    if (level >= 80) return Colors.green.shade600;
    if (level >= 60) return Colors.blue.shade600;
    return Colors.orange.shade600;
  }
}