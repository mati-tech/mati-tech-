import 'package:flutter/material.dart';

class EducationTimeline extends StatelessWidget {
  const EducationTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: isMobile
          ? const EdgeInsets.symmetric(vertical: 40, horizontal: 16)
          : const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Text(
            'Education & Experience',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 48),
          isMobile ? _buildMobileTimeline(context) : _buildDesktopTimeline(),
        ],
      ),
    );
  }

  Widget _buildDesktopTimeline() {
    final timelineData = _getTimelineData();

    return Column(
      children: timelineData.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isEven = index % 2 == 0;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              if (isEven) ...[
                Expanded(
                  child: _buildTimelineCard(
                    item['year']!,
                    item['title']!,
                    item['company']!,
                    item['description']!,
                    true,
                    false, // isMobile = false for desktop
                  ),
                ),
                const SizedBox(width: 40),
                _buildTimelineNode(index == 0),
                const SizedBox(width: 40),
                const Expanded(child: SizedBox()),
              ] else ...[
                const Expanded(child: SizedBox()),
                const SizedBox(width: 40),
                _buildTimelineNode(false),
                const SizedBox(width: 40),
                Expanded(
                  child: _buildTimelineCard(
                    item['year']!,
                    item['title']!,
                    item['company']!,
                    item['description']!,
                    false,
                    false, // isMobile = false for desktop
                  ),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileTimeline(BuildContext context) {
    final timelineData = _getTimelineData();
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Column(
      children: timelineData.map((item) {
        return _buildTimelineCard(
          item['year']!,
          item['title']!,
          item['company']!,
          item['description']!,
          true,
          isMobile, // Pass isMobile as true
        );
      }).toList(),
    );
  }

  List<Map<String, String>> _getTimelineData() {
    return [
      {
        'year': '2025',
        'title': 'Flutter Development',
        'company': 'Flutter Dev',
        'description': 'Completed a comprehensive Flutter development '
            'course with hands-on project experience. '
            'Built multiple cross-platform mobile applications '
            'using Dart, implementing state management, responsive UI design, and Firebase integration in final projects.',
      },

      {
        'year': '2023 - 2024',
        'title': 'Kotlin Mobile Development, Samsung Academy, Moscow',
        'company': 'Samsung Innovation Campus',
        'description': 'Mastered Kotlin for mobile development through '
            'Samsung\'s specialized academy. Developed a strong foundation'
            ' in building native Android applications, focusing on UI/UX '
            'design, '
            'architecture patterns, and performance optimization.',
      },
      {
        "year": "2023",
        "title": "Mobile Application Development",
        "company": "Innopolis University",
        "description": "Successfully passed a skills assessment in mobile development, validating practical competencies and knowledge in the field. The program was conducted in partnership with MIREA - Russian Technological University."
      },
      {
        'year': '2022 - Present',
        'title': 'Bachelor of Software Engineering',
        'company': 'MIREA - Russian Technological University',
        'description': 'Comprehensive software engineering education covering modern technologies and methodologies. '
            'Programming languages: C++, Python, Java, Kotlin, Dart/Flutter. '
            'Database systems: SQL (PostgreSQL, MySQL), NoSQL (Cassandra, MongoDB). '
            'Mobile development: Android app development with Kotlin and Flutter. '
            'Web technologies: Full-stack web development. '
            'Advanced topics: IoT systems, Microservices architecture, DevOps practices, '
            'Project management methodologies, System administration, and Software engineering principles.',
      },
      {
        'year': '2021 - 2022',
        'title': 'Russian Language Diploma',
        'company': 'MIREA - Russian Technological University',
        'description': 'One-year intensive Russian language program focusing on comprehensive language skills '
            'and cultural understanding for academic success in Russia.',
      },
      {
        'year': '2020 - 2021',
        'title': 'Computer Technician',
        'company': 'Roots of Peace',
        'description': 'Provided technical support and maintenance for computer systems and networks. '
            'Collaborated with a dedicated team to ensure optimal IT infrastructure performance '
            'and supported organizational operations.',
      },
      {
        'year': '2019 - 2020',
        'title': 'Software Engineer',
        'company': 'Kabul University',
        'description': '1 year workshop in Software engineering, focus on mobile applications and web services.',
      },
      {
        'year': '2007 - 2019',
        'title': 'High School Diploma',
        'company': 'KEN Private School',
        'description': 'Graduated with honors, achieving outstanding academic performance with a GPA of 3.9/4.0 (98.6%). '
            'Developed strong foundational knowledge and academic discipline.',
      },
    ];
  }

  Widget _buildTimelineCard(String year, String title, String company, String description, bool alignLeft, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: isMobile
          ? const EdgeInsets.only(bottom: 20) // Less margin on mobile
          : const EdgeInsets.only(bottom: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: TextStyle(
              color: Colors.blue.shade600,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            company,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              color: Colors.black54,
              height: 1.5,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }

  // This method is now only used in desktop mode
  Widget _buildTimelineNode(bool isFirst) {
    return Column(
      children: [
        if (!isFirst) Container(
          width: 2,
          height: 40,
          color: Colors.blue.shade300,
        ),
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.shade600,
            border: Border.all(color: Colors.white, width: 3),
          ),
        ),
        Container(
          width: 2,
          height: 40,
          color: Colors.blue.shade300,
        ),
      ],
    );
  }
}