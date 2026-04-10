import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
  bool _biometricLock = true;
  bool _emailAlerts = true;

  void _showInfo(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAF9F6),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Privacy & Security',
          style: GoogleFonts.manrope(color: AppTheme.splashPrimary, fontWeight: FontWeight.w800, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SectionCard(
              children: [
                _ToggleTile(
                  title: 'Biometric Lock',
                  subtitle: 'Require Face ID or fingerprint to open app.',
                  value: _biometricLock,
                  onChanged: (value) => setState(() => _biometricLock = value),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                _ToggleTile(
                  title: 'Security Email Alerts',
                  subtitle: 'Get alerts for sensitive account changes.',
                  value: _emailAlerts,
                  onChanged: (value) => setState(() => _emailAlerts = value),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _SectionCard(
              children: [
                _ActionTile(
                  icon: Icons.lock_reset,
                  title: 'Change Password',
                  onTap: () => _showInfo('Password reset link sent to your email.'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16),
                _ActionTile(
                  icon: Icons.description_outlined,
                  title: 'Privacy Policy',
                  onTap: () => _showInfo('Privacy policy is coming soon.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final List<Widget> children;

  const _SectionCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(children: children),
    );
  }
}

class _ToggleTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _ToggleTile({required this.title, required this.subtitle, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChanged,
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.splashPrimary),
      ),
      subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 12, color: AppTheme.splashOnSurfaceVariant)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      activeColor: AppTheme.splashPrimary,
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionTile({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      leading: Icon(icon, color: AppTheme.splashPrimary),
      title: Text(
        title,
        style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.splashPrimary),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFFD0C4BC), size: 20),
    );
  }
}
