import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoutineClashCheckerScreen extends StatelessWidget {
  const RoutineClashCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // TopAppBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuABiRTfI4f6TT7mLgzZxzAOahSIjmjCf0zQmflitmPNKS3aopQRrce-Jr0d-YLDMmfvjNdLI_fJSV0_aHS9b0X28ia6QKQCpjlwSrVEO_WTT_CR2wr4mzIZW3Tfj1PDmnZjunOfuCyQ6CU91IzooexH8ZLmf916OTJNCXhyORdMZ_EBmwWMJ09FfI5a3heZ6-9dJpUwuuoMiYHVceP8aVEHeCGha8Kmsluum8OYsmo8d7Pl3v-mlxGlpiE2aNLn6-HYz2sgQc366m9J'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'SkinSeek',
                            style: GoogleFonts.manrope(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF675D53),
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Color(0xFF675D53)),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hero Section
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.manrope(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                              height: 1.1,
                              color: const Color(0xFF675D53),
                              letterSpacing: -1,
                            ),
                            children: const [
                              TextSpan(text: 'Routine Clash\n'),
                              TextSpan(
                                text: 'Checker',
                                style: TextStyle(
                                  color: Color(0xFF765847),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Ensure your actives play well together. We\'ve analyzed your AM & PM rituals for safety.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF4D453F).withValues(alpha: 0.8),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 48),

                        // AM Routine Timeline
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AM Morning Ritual',
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF675D53),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF5E6DA),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                'SAFE ROUTINE',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: const Color(0xFF71665D),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const _TimelineView(
                          isAm: true,
                        ),

                        const SizedBox(height: 48),
                        
                        // Conflict Alert Section
                        const _ConflictAlertCard(),

                        const SizedBox(height: 48),

                        // PM Routine Timeline
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'PM Evening Ritual',
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF675D53),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFDAD6),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                '1 CONFLICT DETECTED',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0,
                                  color: const Color(0xFF93000A),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        const _TimelineView(
                          isAm: false,
                        ),

                        const SizedBox(height: 48),

                        // Bento Analysis Grid
                        const _BentoAnalysisGrid(),
                        
                        const SizedBox(height: 100), // padding for bottom nav
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineView extends StatelessWidget {
  final bool isAm;

  const _TimelineView({required this.isAm});

  @override
  Widget build(BuildContext context) {
    if (isAm) {
      return Stack(
        children: [
          // Vertical Line
          Positioned(
            left: 11,
            top: 16,
            bottom: 16,
            child: Container(
              width: 2,
              color: const Color(0xFFD0C4BC).withValues(alpha: 0.3),
            ),
          ),
          Column(
            children: [
              _TimelineNode(
                stepNum: '01',
                stepType: 'CLEANSER',
                productName: 'Squalane Hydrating Cleanser',
                description: 'PH-balanced formula. No conflicting actives present.',
                icon: Icons.check_circle,
                iconColor: const Color(0xFF16A34A),
                iconBgColor: const Color(0xFFF0FDF4),
              ),
              const SizedBox(height: 32),
              _TimelineNode(
                stepNum: '02',
                stepType: 'SERUM',
                productName: '15% Vitamin C + E Ferulic',
                icon: Icons.check_circle,
                iconColor: const Color(0xFF16A34A),
                iconBgColor: const Color(0xFFF0FDF4),
                badgeText: 'Photoprotective Synergist',
                badgeIcon: Icons.flare,
              ),
            ],
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          // Vertical Line
          Positioned(
            left: 11,
            top: 16,
            bottom: 16,
            child: Container(
              width: 2,
              color: const Color(0xFFD0C4BC).withValues(alpha: 0.3),
            ),
          ),
          Column(
            children: [
              _TimelineNode(
                stepNum: '01',
                stepType: 'EXFOLIATE',
                productName: 'Salicylic Acid 2% Solution',
                description: 'Clashes with Retinol used in Step 02. High risk of redness.',
                icon: Icons.error,
                iconColor: const Color(0xFFBA1A1A),
                iconBgColor: const Color(0xFFFFDAD6).withValues(alpha: 0.5),
                isError: true,
              ),
              const SizedBox(height: 32),
              _TimelineNode(
                stepNum: '02',
                stepType: 'TREATMENT',
                productName: 'Retinol 0.5% in Squalane',
                icon: Icons.sync_problem,
                iconColor: const Color(0xFFBA1A1A),
                iconBgColor: const Color(0xFFFFDAD6).withValues(alpha: 0.5),
                hasInteractionCard: true,
                isErrorOutline: true,
              ),
              const SizedBox(height: 32),
              _TimelineNode(
                stepNum: '03',
                stepType: 'MOISTURIZE',
                productName: 'Natural Moisturizing Factors',
                icon: Icons.lock_clock,
                iconColor: const Color(0xFF4D453F).withValues(alpha: 0.4),
                iconBgColor: Colors.transparent,
                isFaded: true,
              ),
            ],
          ),
        ],
      );
    }
  }
}

class _TimelineNode extends StatelessWidget {
  final String stepNum;
  final String stepType;
  final String productName;
  final String? description;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String? badgeText;
  final IconData? badgeIcon;
  final bool isError;
  final bool hasInteractionCard;
  final bool isErrorOutline;
  final bool isFaded;

  const _TimelineNode({
    required this.stepNum,
    required this.stepType,
    required this.productName,
    this.description,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    this.badgeText,
    this.badgeIcon,
    this.isError = false,
    this.hasInteractionCard = false,
    this.isErrorOutline = false,
    this.isFaded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Circular node passing through the line
          Positioned(
            left: -32 - 11, // align with line
            top: 8,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFF675D53), width: 4),
              ),
            ),
          ),
          
          // Content Card
          Opacity(
            opacity: isFaded ? 0.6 : 1.0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: isErrorOutline ? Border.all(color: const Color(0xFFFFDAD6), width: 2) : null,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF675D53).withValues(alpha: 0.04),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Step $stepNum • $stepType',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF765847).withValues(alpha: 0.6),
                                letterSpacing: 1.5,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              productName,
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF675D53),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: iconBgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, color: iconColor, size: 20),
                      ),
                    ],
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 12),
                    Text(
                      description!,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: isError ? iconColor : const Color(0xFF4D453F),
                        fontWeight: isError ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                  ],
                  if (badgeText != null) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE7A8).withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(badgeIcon, size: 14, color: const Color(0xFF7F6500)),
                          const SizedBox(width: 6),
                          Text(
                            badgeText!,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF7F6500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  if (hasInteractionCard) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F3F1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuAasKsoBqPa_3sBYcy48WLACHzA5tuL9kjBlHH9DNXkKGCQeVAhfEHmBJ-q3dEPzFn3X1oUtYKkRK-eClkgcoRN4QHy3GRKs3Tmd7a9ij-IV6LDAxaXqdMag1gtkA5awUSI1zcz_gfC4RPGo1m4L5KKc_ZHlu4sYQYjFcMPKlTsvk91ukKniipD3yYjr7llOlp8MKb_0Ef8C5gCmnuJPGxYaa2aKs3l-huQ5c-ubfUqMzXS1mOpiccYPctHiD1SUHpDREzbtZoM9BwC',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RECOMMENDATION',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF765847),
                                    letterSpacing: 1.0,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Switch to Glycolic Acid on alternate nights.',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: const Color(0xFF4D453F),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConflictAlertCard extends StatelessWidget {
  const _ConflictAlertCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDAD6).withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFBA1A1A).withValues(alpha: 0.1)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -20,
            child: Icon(
              Icons.warning,
              size: 160,
              color: const Color(0xFFBA1A1A).withValues(alpha: 0.05),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.report, color: Color(0xFFBA1A1A), size: 24),
                  const SizedBox(width: 12),
                  Text(
                    'Potential Ingredient Conflict',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFBA1A1A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF93000A),
                    height: 1.6,
                  ),
                  children: const [
                    TextSpan(text: 'You\'ve added '),
                    TextSpan(text: 'Retinol 0.5%', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' to your PM routine while using '),
                    TextSpan(text: 'Salicylic Acid 2%', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' tonight. Combining these can cause extreme irritation and barrier compromise.'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF675D53),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                onPressed: () {},
                child: Text(
                  'Optimize Routine',
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BentoAnalysisGrid extends StatelessWidget {
  const _BentoAnalysisGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top full-width card
        Container(
          width: double.infinity,
          height: 160,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF5E6DA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.auto_fix_high, color: Color(0xFF675D53), size: 36),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Smart Switch™',
                    style: GoogleFonts.manrope(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF675D53),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Our AI suggests moving your Vitamin C to AM to avoid interactions with PM Retinoids.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF71665D),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Bottom two cards
        Row(
          children: [
            Expanded(
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9E8E5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '84%',
                      style: GoogleFonts.manrope(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                        color: const Color(0xFF675D53),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ROUTINE SAFETY',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF765847),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDD4C0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2',
                      style: GoogleFonts.manrope(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF765847),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'ACTIVE PAIRS',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF765847),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
