import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:skinseek_app/core/theme/app_theme.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Content
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 120, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _NotificationGroup(
                  title: 'TODAY',
                  notifications: [
                    _NotificationItem(
                      icon: Icons.water_drop,
                      iconColor: Color(0xFF5D7B6F),
                      title: 'Evening Hydration',
                      message: 'Time for your PM routine. Your skin hydration is up 12% today!',
                      time: '2h ago',
                      isUnread: true,
                    ),
                    _NotificationItem(
                      icon: Icons.flare,
                      iconColor: Color(0xFF735C00),
                      title: 'New Skin Insight',
                      message: 'We\'ve detected a decrease in redness around your T-zone.',
                      time: '5h ago',
                      isUnread: true,
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const _NotificationGroup(
                  title: 'EARLIER',
                  notifications: [
                    _NotificationItem(
                      icon: Icons.savings_outlined,
                      iconColor: Color(0xFF675D53),
                      title: 'Dupe found!',
                      message: 'We found a 98% match for your luxury serum at a 70% lower price.',
                      time: 'Yesterday',
                    ),
                    _NotificationItem(
                      icon: Icons.auto_fix_high,
                      iconColor: Color(0xFF735C00),
                      title: 'Routine Optimization',
                      message: 'Try switching your Vitamin C to morning application for better results.',
                      time: '2 days ago',
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Sticky Glass Header
          const _NotificationHeader(),
        ],
      ),
    );
  }
}

class _NotificationHeader extends StatelessWidget {
  const _NotificationHeader();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 16),
            color: const Color(0xFFFAF9F6).withValues(alpha: 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: AppTheme.splashPrimary),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Notifications',
                      style: GoogleFonts.manrope(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Clear all',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.splashPrimary.withValues(alpha: 0.6),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationGroup extends StatelessWidget {
  final String title;
  final List<_NotificationItem> notifications;

  const _NotificationGroup({required this.title, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 16),
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: AppTheme.splashOnSurfaceVariant.withValues(alpha: 0.4),
              ),
            ),
          ),
          ...notifications,
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool isUnread;

  const _NotificationItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.time,
    this.isUnread = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.manrope(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.splashPrimary,
                      ),
                    ),
                    Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: AppTheme.splashOnSurfaceVariant.withValues(alpha: 0.4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppTheme.splashOnSurfaceVariant.withValues(alpha: 0.7),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (isUnread)
            Container(
              margin: const EdgeInsets.only(left: 8, top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF735C00),
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
