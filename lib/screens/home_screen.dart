import 'package:flutter/material.dart';
import '../widgets/Certifications.dart';
import '../widgets/header.dart';
import '../widgets/about_section.dart';
import '../widgets/education_timeline.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // Create GlobalKeys for each section
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _certificatesKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      // Get the render box of the section
      final renderBox = context.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        // Get the position of the section
        final position = renderBox.localToGlobal(Offset.zero);
        final scrollPosition = position.dy;

        // Calculate the offset considering the app bar height
        final double appBarHeight = Scaffold.of(context).appBarMaxHeight ?? 0;
        final double offset = scrollPosition - appBarHeight - 20; // 20px padding

        // Scroll to the calculated position
        _scrollController.animateTo(
          offset,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    }
  }

  // Alternative method using ensureVisible (more reliable)
  void _scrollToSectionAlt(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0, // Scroll to 10% from top (below app bar)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile ? _buildMobileAppBar() : _buildDesktopAppBar(),
      drawer: isMobile ? _buildMobileDrawer() : null,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Pass keys to each section
            HeaderSection(key: _headerKey),
            AboutSection(key: _aboutKey),
            EducationTimeline(key: _educationKey),
            SkillsSection(key: _skillsKey),
            CertificatesSection(key: _certificatesKey),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  AppBar _buildDesktopAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25)
      )
    ),
    //     shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //     bottomRight: Radius.circular(25),
    //     bottomLeft: Radius.circular(25)
    // ),
      title: const Text(
        "Mati's Portfolio",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      actions: [
        _buildNavItem('About', _aboutKey),
        _buildNavItem('Education', _educationKey),
        _buildNavItem('Skills', _skillsKey),
        _buildNavItem('Certifications', _certificatesKey),
        _buildNavItem('Projects', _projectsKey),
        _buildNavItem('Contact', _contactKey),
      ],
    );
  }

  AppBar _buildMobileAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,

      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)
          )
      ),
      title: const Text(
        "Mati's Portfolio",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
    );
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.redAccent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Mati's Portfolio",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Discover my world!',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          _buildMobileDrawerItem('Home', _headerKey, Icons.home),
          _buildMobileDrawerItem('About', _aboutKey, Icons.person),
          _buildMobileDrawerItem('Education', _educationKey, Icons.school),
          _buildMobileDrawerItem('Skills', _skillsKey, Icons.build),
          _buildMobileDrawerItem('Certificates', _certificatesKey, Icons.document_scanner),
          _buildMobileDrawerItem('Projects', _projectsKey, Icons.work),
          _buildMobileDrawerItem('Contact', _contactKey, Icons.contact_mail),
        ],
      ),
    );
  }

  Widget _buildMobileDrawerItem(String text, GlobalKey key, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade600),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close drawer
        _scrollToSectionAlt(key); // Use alternative method
      },
    );
  }

  Widget _buildNavItem(String text, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSectionAlt(key),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}