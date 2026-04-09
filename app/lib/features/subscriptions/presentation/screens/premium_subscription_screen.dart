import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';
import 'package:skinseek_app/core/theme/app_theme.dart';

class PremiumSubscriptionScreen extends StatelessWidget {
  const PremiumSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 120, 24, 60),
            child: Column(
              children: [
                const _HeroSection(),
                const SizedBox(height: 48),
                const _BenefitsGrid(),
                const SizedBox(height: 64),
                const _ComparisonTable(),
                const SizedBox(height: 64),
                const _PricingPricingSection(),
                const SizedBox(height: 48),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Restore Purchase',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.splashOnSurfaceVariant.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Sticky Glass Header
          const _SubscriptionHeader(),
        ],
      ),
    );
  }
}

class _SubscriptionHeader extends StatelessWidget {
  const _SubscriptionHeader();

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
            color: const Color(0xFFFAF9F6).withOpacity(0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SkinSeek',
                  style: GoogleFonts.manrope(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.splashPrimary,
                    letterSpacing: -1,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppTheme.splashPrimary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE7A8),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Color(0xFF735C00), size: 14),
              const SizedBox(width: 8),
              Text(
                'PREMIUM ACCESS',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                  color: const Color(0xFF7F6500),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Unlock Your Full Glow',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(
            fontSize: 42,
            fontWeight: FontWeight.w800,
            color: AppTheme.splashPrimary,
            letterSpacing: -1.5,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Elevate your skincare routine with AI-powered insights designed for your unique complexion.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 17,
            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class _BenefitsGrid extends StatelessWidget {
  const _BenefitsGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Unlimited Analysis Card
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF735C00).withOpacity(0.04),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Unlimited analyses',
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.splashPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Scan and track your skin\'s health daily without limits. Real-time evolution tracking.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuC92szDLGca-Zs9HFHP0wNkZamqD0lWzTdrozyFtC9VJPDGegW5RiAthAEV-aMtVsOiDsAe07i4JMVZ9IZaetURgqd-RuXBtP-wQhLfV3zt793G7cglF61GvBdYqcYiTwevh0Ka_nkHAGKB6N3MwYorOIvSCI_UD-_oasnmkStYkiU_PpGklFKZc3zQIb4vq_0D3ztXTBbkOBQzFgXrbRcYMGGW9_du51Udqz28hP7FwXMS3tLMQ8TfNNhsoDJf2nfOz4uUF2XPr333'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _BenefitSmallCard(
                icon: Icons.auto_fix_high,
                title: 'Advanced clash detection',
                subtitle: 'AI-powered checks for active harmony.',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _BenefitSmallCard(
                icon: Icons.content_copy,
                title: 'Unlimited dupes',
                subtitle: 'Find high-perf affordable alts.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _BenefitSmallCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _BenefitSmallCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F1),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF735C00), size: 24),
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.splashPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonTable extends StatelessWidget {
  const _ComparisonTable();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Compare Plans',
          style: GoogleFonts.manrope(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppTheme.splashPrimary,
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF4F3F1),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              const _ComparisonRow(label: 'Feature', free: 'Free', premium: 'Premium', isHeader: true),
              const _ComparisonRow(label: 'Daily Analysis', free: '1 / day', premium: 'Unlimited', isAlternate: true),
              const _ComparisonRow(label: 'Clash Check', free: '-', premium: 'Advanced'),
              const _ComparisonRow(label: 'Ingredient Library', free: 'Basic', premium: 'Full Access', isAlternate: true),
              const _ComparisonRow(label: 'Expert Support', free: '-', premium: 'Priority'),
            ],
          ),
        ),
      ],
    );
  }
}

class _ComparisonRow extends StatelessWidget {
  final String label;
  final String free;
  final String premium;
  final bool isHeader;
  final bool isAlternate;

  const _ComparisonRow({
    required this.label,
    required this.free,
    required this.premium,
    this.isHeader = false,
    this.isAlternate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isAlternate ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                color: isHeader ? AppTheme.splashOnSurfaceVariant : AppTheme.splashPrimary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              free,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppTheme.splashOnSurfaceVariant.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            child: Text(
              premium,
              textAlign: TextAlign.right,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF735C00),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PricingPricingSection extends StatelessWidget {
  const _PricingPricingSection();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF675D53), Color(0xFF4E453C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF675D53).withOpacity(0.4),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'EXCLUSIVE OFFER',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFFD2C4B9),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '£9.99',
                    style: GoogleFonts.manrope(
                      fontSize: 64,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -2,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '/month',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: const Color(0xFFD2C4B9),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: double.infinity,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFE088), Color(0xFFE9C349)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE9C349).withOpacity(0.3),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Subscribe Now',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF241A00),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Secure checkout. Cancel anytime. By subscribing, you agree to our Terms of Service and Privacy Policy.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: Colors.white.withOpacity(0.5),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.timer_outlined, color: Color(0xFF735C00), size: 18),
                const SizedBox(width: 8),
                Text(
                  'Ends in 04:59',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.splashPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
