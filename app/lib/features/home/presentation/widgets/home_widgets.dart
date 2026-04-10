import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/home/presentation/screens/notification_screen.dart';
import 'package:skinseek_app/features/barcode/presentation/screens/scanner_screen.dart';
import 'package:skinseek_app/features/routine/presentation/screens/routine_clash_checker_screen.dart';
import 'package:skinseek_app/features/dupes/presentation/screens/dupe_finder_screen.dart';
import 'package:skinseek_app/features/history/presentation/screens/history_screen.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      height: 64,
      decoration: BoxDecoration(color: const Color(0xFFFAF9F6).withValues(alpha: 0.7)),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuC3udNqD_Av8ZVD3_Xl4bKEAkSqPoxmOVLtXNCGTfRY9ZeHvG_uiQQzv-zGKwnrhOYbskJzuD1m2KHyNxzPiLypDDDtQywNq7_vg7bastq1GgE8GfS65mD4dpet6_173kVhKmcUKv9Ta0TffrSSEVE_vgp6jeqO49kCVwVrb5TV14-tdu3jw-X7wf6ClqdUTbTrZVRY1Kto5P70iKJKOOvG-Mu7SbGW17268RXvh6MODSvOd9JUgIZ7EwA_d4jizmCd-UZmlk3FP2zy',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'SkinSeek',
                    style: GoogleFonts.manrope(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationScreen()));
                },
                icon: const Icon(Icons.notifications_outlined, color: Color(0xFF675D53)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingSection extends StatelessWidget {
  final String userName;
  const GreetingSection({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.flare, color: Color(0xFF735C00), size: 20),
            const SizedBox(width: 8),
            Text(
              'MORNING RITUAL',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppTheme.splashOnSurfaceVariant.withValues(alpha: 0.7),
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Good morning, $userName',
          style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.black, letterSpacing: -1),
        ),
        const SizedBox(height: 8),
        Text(
          'Your skin hydration is up by 12% today. Let\'s keep the glow going.',
          style: GoogleFonts.inter(fontSize: 15, color: Colors.black.withValues(alpha: 0.7), height: 1.5),
        ),
      ],
    );
  }
}

class ActionBentoGrid extends StatelessWidget {
  const ActionBentoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Analyze Ingredients (Large Card)
        _BentoCard(
          title: 'Analyze Ingredients',
          subtitle: 'Scan any product label to identify potential irritants or hero ingredients instantly.',
          buttonLabel: 'Start Scan',
          icon: Icons.search_rounded,
          backgroundColor: Colors.white,
          isLarge: true,
          buttonGradient: [Color(0xFFF5E6DA), Color(0xFF675D53)],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AdvancedScannerScreen()),
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            // Check Routine (Square)
            Expanded(
              child: _BentoCard(
                title: 'Check Routine',
                subtitle: 'Optimize your layering order.',
                buttonLabel: 'Optimize',
                icon: Icons.sync,
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                buttonColor: Color.fromARGB(255, 255, 255, 255),
                buttonLabelColor: Colors.black,
                backgroundImage:
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDWu90V-CrOm0oZk_HgpmmzeNMfS4c-D-GH0yLNkyXO7ePujx33767OSwoVbtEHHU-uvhfHLkNcDlHjJgkc_chblCxeSKEhabyI1Cic0Y0-r9Q2iMiv1LRxUyW_QtAvA0CE8ken63MrvWVo1_tk3ztOxDGuu9vZol-eP2uvrMNmINYJwsgSaJujPZM2gqmjNKCDFim23ImCn9apEsxBBeHRKhPnULDqAccgaCbfvWXGulpUyVCOMpO_ID20wVQ_ubgf2bLItt-VuvOm',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RoutineClashCheckerScreen()),
                  );
                },
              ),
            ),
            SizedBox(width: 16),
            // Find Dupes (Square)
            Expanded(
              child: _BentoCard(
                title: 'Find Dupes',
                subtitle: 'Save on luxury formulas.',
                buttonLabel: 'Explore',
                icon: Icons.savings_outlined,
                backgroundColor: Color(0xFF675D53),
                isDark: true,
                buttonLabelColor: Color(0xFF7F6500),
                buttonColor: Color(0xFFFFE088),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const DupeFinderScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BentoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonLabel;
  final IconData icon;
  final Color backgroundColor;
  final bool isLarge;
  final bool isDark;
  final List<Color>? buttonGradient;
  final Color? buttonColor;
  final Color? buttonLabelColor;
  final String? backgroundImage;
  final VoidCallback? onTap;

  const _BentoCard({
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.icon,
    required this.backgroundColor,
    this.isLarge = false,
    this.isDark = false,
    this.buttonGradient,
    this.buttonColor,
    this.buttonLabelColor,
    this.backgroundImage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: isLarge ? 220 : 216,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
          image: backgroundImage != null
              ? DecorationImage(image: NetworkImage(backgroundImage!), fit: BoxFit.cover, opacity: 0.15)
              : null,
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 40, offset: const Offset(0, 20))],
        ),
        child: Stack(
          children: [
            if (isDark && !isLarge)
              Positioned(
                right: -20,
                bottom: -20,
                child: Icon(Icons.paid, size: 140, color: Colors.white.withValues(alpha: 0.05)),
              ),
            Padding(
              padding: EdgeInsets.all(isLarge ? 24 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(isLarge ? 10 : 8),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white.withValues(alpha: 0.1) : (isLarge ? const Color(0xFFF5E6DA) : Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: isDark ? Colors.white : AppTheme.splashPrimary, size: isLarge ? 24 : 20),
                  ),
                  if (isLarge) const Spacer() else const SizedBox(height: 12),
                  Text(
                    title,
                    style: GoogleFonts.manrope(
                      fontSize: isLarge ? 22 : 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: isLarge ? 4 : 2),
                  Text(
                    subtitle,
                    maxLines: isLarge ? 2 : 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: isLarge ? 12 : 11,
                      color: isDark ? Colors.white.withValues(alpha: 0.7) : Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                  SizedBox(height: isLarge ? 16 : 12),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: isLarge ? 20 : 16, vertical: isLarge ? 10 : 8),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      gradient: buttonGradient != null ? LinearGradient(colors: buttonGradient!) : null,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      buttonLabel,
                      style: GoogleFonts.manrope(
                        fontSize: isLarge ? 13 : 12,
                        fontWeight: FontWeight.bold,
                        color: buttonLabelColor ?? Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecentScansSection extends StatelessWidget {
  const RecentScansSection({super.key});

  @override
  Widget build(BuildContext context) {
    final scans = [
      _ScanItem(
        name: 'Aura Glow Serum',
        category: 'NIACINAMIDE 10%',
        match: '98% Match',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDjrdX2TFfFNbxb2hVHd6bDRsuoSzrV6ihdmdfm3_dJR2NCLCjphLNVa9XQ7SfxBVtAN6FeEEgHMfhHtF-nQOAEjgwfszIWhCxn-A9N-6wzFIrKzWFArIS9PF_PFjzQOZUG7yBwhb9Xa3tZCKi7hwyzhNeOi5N0rUuVmNmuDUXjS7vY-Ya16XRAaxOAqp1KfJZikRiDzB6sW6QVlZ_cwAYdjsU6GxSJQDHT43MBPidIQpddQc1aPbOnv3T1gaKJl8nFcUPFGQcs5TVN',
      ),
      _ScanItem(
        name: 'Barrier Restore',
        category: 'CERAMIDES + HA',
        match: '84% Match',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCC-aY7eNXZx-_8dtuyWI4UWc2_c78pDQhA7McnujYi7WIePqxrXsD4cadvN3x-L86TQslIEdYfAA1Otr6I-Z4hy3gytrJWTa0_gjzsf7hh3r-e2MtCyNdTz3ar6Fp3Tfuq92RadCZ5ZoxDUh8vwaJ7-KS6DTzFN4--B2NJvbRwNrHE5s_vibrR_5VjojxxrBw3R4ZlyZegkg6u2GqjG5JdMG0m91jrBdebt_sCDKNxyVMC8Zi0rvue5G5EcdR9BQWnsReiwtfL88gX',
      ),
      _ScanItem(
        name: 'Cloud Foam Wash',
        category: 'GENTLE CLEANSER',
        match: '92% Match',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBiXEwsGGEHKYwkbzs4xBoGLtGAPmLtU-bdS0iMIYtCww-ayOvgGWO7mb5diAWkXlt9SfkfVxYRUS__Paqofw0Pz2pXK2SZav33sOYjli99psOJ1RD9ZKmsmMN_0_rdMpCfH6-WJ_avPbfEjHEarfBaPcDeFLfOON5OklD9gCfdAX_b90k8qxjk9qucNIfasiasZ4pgWOK1ueugLuWon_RSW0zTBD69azgUZbgLwt-PxqWfMkL7OzMebWlWwHNQd5Qh7Y1I0bM5TjJR',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Scans',
                  style: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  'Your digital shelf history',
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.black.withValues(alpha: 0.5)),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoryScreen()));
              },
              child: Text(
                'View All',
                style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView.separated(
            padding: const EdgeInsets.only(right: 24),
            scrollDirection: Axis.horizontal,
            itemCount: scans.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final item = scans[index];
              return Container(
                width: 180,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 20, offset: const Offset(0, 10))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(item.imageUrl, fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.category,
                      style: GoogleFonts.inter(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        color: const Color(0xFF7F6500),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.manrope(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Color(0xFF735C00), size: 12),
                        const SizedBox(width: 4),
                        Text(item.match, style: GoogleFonts.inter(fontSize: 11, color: Colors.black.withValues(alpha: 0.5))),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ScanItem {
  final String name;
  final String category;
  final String match;
  final String imageUrl;

  _ScanItem({required this.name, required this.category, required this.match, required this.imageUrl});
}

class DashboardBottomNav extends StatelessWidget {
  const DashboardBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: const Color(0xFF675D53).withValues(alpha: 0.08), blurRadius: 40, offset: const Offset(0, 20)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavIcon(icon: Icons.home_filled, isSelected: true),
              _NavIcon(icon: Icons.flare, isSelected: false),
              _NavIcon(icon: Icons.auto_fix_high, isSelected: false),
              _NavIcon(icon: Icons.person_outline, isSelected: false),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _NavIcon({required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: isSelected
          ? const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [BoxShadow(color: Color(0xFF675D53), blurRadius: 12, offset: Offset(0, 4), spreadRadius: -2)],
            )
          : null,
      child: Icon(icon, color: isSelected ? Colors.white : const Color(0xFF675D53).withValues(alpha: 0.84), size: 24),
    );
  }
}
