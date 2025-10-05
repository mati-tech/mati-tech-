import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSending = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // Future<void> _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isSending = true;
  //     });
  //
  //     // Simulate form submission
  //     await Future.delayed(const Duration(seconds: 2));
  //
  //     setState(() {
  //       _isSending = false;
  //     });
  //
  //     // Show success dialog
  //     _showSuccessDialog();
  //   }
  // }
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      final String botToken = "8441909794:AAEun43MZl66jQrnuRWJI1JIc6a_r6fA6Ls";
      final String chatId = "1237042422";

      final String text =
          "📩 New Contact Form Submission:\n"
          "👤 Name: ${_nameController.text}\n"
          "📧 Email: ${_emailController.text}\n"
          "📝 Subject: ${_subjectController.text}\n"
          "💬 Message: ${_messageController.text}";

      final url =
          "https://api.telegram.org/bot$botToken/sendMessage?chat_id=$chatId&text=${Uri.encodeComponent(text)}";

      try {
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          // ✅ Message sent successfully
          _showSuccessDialog();
          _clearForm();
        } else {
          // ⚠️ Error
          _showErrorDialog("Failed to send message. Please try again later.");
        }
      } catch (e) {
        _showErrorDialog("Error: $e");
      }

      setState(() {
        _isSending = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }


  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Message Sent!'),
        content: const Text('Thank you for your message. I will get back to you soon.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _clearForm();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width < 900;

    return Container(
      padding: isMobile
          ? const EdgeInsets.symmetric(vertical: 40, horizontal: 16)
          : const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Ready to bring your ideas to life? Let\'s discuss your project!',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          isMobile
              ? _buildMobileLayout()
              : isTablet
              ? _buildTabletLayout()
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
          child: _buildContactForm(),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: _buildContactInfo(),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: [
        _buildContactForm(),
        const SizedBox(height: 40),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContactForm(),
        const SizedBox(height: 40),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildFormField(
              'Full Name',
              Icons.person_outline,
              _nameController,
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildFormField(
              'Email Address',
              Icons.email_outlined,
              _emailController,
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildFormField(
              'Subject',
              Icons.subject_outlined,
              _subjectController,
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            _buildFormField(
              'Message',
              Icons.message_outlined,
              _messageController,
                  (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                if (value.length < 10) {
                  return 'Message should be at least 10 characters';
                }
                return null;
              },
              maxLines: 5,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSending ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: _isSending
                    ? const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                    SizedBox(width: 12),
                    Text('Sending...'),
                  ],
                )
                    : const Text(
                  'Send Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(
      String label,
      IconData icon,
      TextEditingController controller,
      FormFieldValidator<String> validator, {
        int maxLines = 1,
      }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue.shade600),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue.shade600, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      textInputAction: maxLines > 1 ? TextInputAction.newline : TextInputAction.next,
    );
  }

  Widget _buildContactInfo() {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Feel free to reach out through any of these channels',
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 32),
          _buildContactItem(
            Icons.email_outlined,
            'Email',
            'azizmatiullah@yahoo.com',
                () => launchUrl(Uri.parse('mailto:azizmatiullah@yahoo.com?subject=Portfolio Contact')),
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            Icons.phone_outlined,
            'Phone',
            '+7 (968) 469-4873',
                () => launchUrl(Uri.parse('tel:+79684694873')),
          ),
          const SizedBox(height: 20),
          _buildContactItem(
            Icons.location_on_outlined,
            'Location',
            'Moscow, Russia',
            null,
          ),
          const SizedBox(height: 32),
          Text(
            'Follow Me',
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          _buildSocialLinks(),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String subtitle, VoidCallback? onTap) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.blue.shade600, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              if (onTap != null)
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.grey.shade500,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLinks() {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildSocialButton(
          'LinkedIn',
          Icons.business_center_outlined,
          'https://www.linkedin.com/in/mati-tech/',
        ),
        _buildSocialButton(
          'GitHub',
          Icons.code_outlined,
          'https://github.com/mati-tech',
        ),
        _buildSocialButton(
          'Twitter',
          Icons.cancel,
          'https://x.com/mati_aziz2127',
        ),
        if (!isMobile) ...[
          _buildSocialButton(
            'Instagram',
            Icons.camera_alt_outlined,
            'https://www.instagram.com/mati.aziz2/',
          ),
          _buildSocialButton(
            'Portfolio',
            Icons.public_outlined,
            'https://mati-tech.com',
          ),
        ],
      ],
    );
  }

  Widget _buildSocialButton(String platform, IconData icon, String url) {
    return OutlinedButton.icon(
      onPressed: () => launchUrl(Uri.parse(url)),
      icon: Icon(icon, size: 16),
      label: Text(platform),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue.shade600,
        side: BorderSide(color: Colors.blue.shade600.withOpacity(0.3)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}