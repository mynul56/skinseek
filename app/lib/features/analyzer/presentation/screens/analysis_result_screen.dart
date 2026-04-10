import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/features/analyzer/domain/models/analysis_result.dart';

class AnalysisResultScreen extends StatelessWidget {
  final AnalysisResult result;

  const AnalysisResultScreen({
    super.key,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    // We scale safety score out of 10 to a 0-100 index for display
    final int skinHealthIndex = (result.safetyScore * 10).round().clamp(0, 100);

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          // Background Glows
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 288,
                height: 288,
                decoration: BoxDecoration(
                  color: const Color(0xFFEFE0D4).withValues(alpha: 0.2), // primary-fixed/20
                  shape: BoxShape.circle,
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 96, sigmaY: 96),
                  child: Container(color: Colors.transparent),
                ),
              ),
            ),
          ),
          
          SafeArea(
            child: Column(
              children: [
                // Minimal TopAppBar
                Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: 40,
                         height: 40,
                         decoration: const BoxDecoration(
                           shape: BoxShape.circle,
                           color: Color(0xFFF4F3F1), // surface-container-low
                         ),
                         child: IconButton(
                           icon: const Icon(Icons.arrow_back, color: Color(0xFF675D53)),
                           onPressed: () => Navigator.pop(context),
                         ),
                       ),
                       Text(
                         'SkinSeek',
                         style: GoogleFonts.manrope(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: const Color(0xFF675D53), // primary
                           letterSpacing: -0.5,
                         ),
                       ),
                       const SizedBox(width: 40), // Spacer to keep title centered
                     ],
                   ),
                ),
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Enhanced Score Section
                        _SkinHealthIndexWidget(score: skinHealthIndex),
                        const SizedBox(height: 40),
                        
                        Text(
                          'Remarkable Clarity', // Could map to specific text based on score
                          style: GoogleFonts.manrope(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1A1C1A),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your barrier function is thriving. Let\'s look at the molecular breakdown.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            color: const Color(0xFF4D453F),
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 40),
                        
                        // Digital Consultation
                        _ConsultationCard(summary: result.summary, totalAnalysed: (result.keyActives.length + result.potentialIrritants.length) * 3 + 12), // Faux number based on array
                        const SizedBox(height: 40),
                        
                        // Cohesive Ingredients Grid
                        _FormulaBreakdownSection(result: result),
                        const SizedBox(height: 40),
                        
                        // Premium Ritual Section
                        _ProTipCard(recommendation: result.recommendation),
                        const SizedBox(height: 40),
                        
                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _ActionButton(
                                icon: Icons.arrow_forward,
                                text: 'Analyze Routine',
                                isPrimary: true,
                                onTap: () {},
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 1,
                              child: _ActionButton(
                                icon: Icons.bookmark,
                                text: 'Save',
                                isPrimary: false,
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        
                        // To account for the potential bottom nav bar overlap
                        const SizedBox(height: 120),
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

// ==========================================
// 1. SKIN HEALTH INDEX WIDGET
// ==========================================
class _SkinHealthIndexWidget extends StatelessWidget {
  final int score;

  const _SkinHealthIndexWidget({required this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.5),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.2), // Score Glow
            blurRadius: 40,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(210, 210),
            painter: _RingPainter(score: score),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: GoogleFonts.manrope(
                  fontSize: 72,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                  letterSpacing: -2,
                  color: const Color(0xFF675D53), // primary
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'SKIN HEALTH INDEX',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: const Color(0xFF7E756E), // outline
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final int score;

  _RingPainter({required this.score});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Track Paint (Dashed effect representation, we'll draw a solid track for now to match exactly 
    // or just use solid background track)
    final trackPaint = Paint()
      ..color = const Color(0xFFE9E8E5) // surface-container-high
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
      
    canvas.drawCircle(center, radius, trackPaint);

    // Progress Paint
    final progressPaint = Paint()
      ..color = const Color(0xFF675D53) // primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    final double sweepAngle = 2 * math.pi * (score / 100);
    // Start at top (-pi/2)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// ==========================================
// 2. AI CONSULTATION CARD
// ==========================================
class _ConsultationCard extends StatelessWidget {
  final String summary;
  final int totalAnalysed;

  const _ConsultationCard({required this.summary, required this.totalAnalysed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF675D53), // primary
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.12),
            blurRadius: 24,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Blur spotlight effect
          Positioned(
            top: -64,
            right: -64,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.auto_fix_high, color: Colors.white, size: 16),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'AI CONSULTATION REPORT',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  '"$summary"',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Divider(color: Colors.white.withValues(alpha: 0.2)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.verified, color: Color(0xFFD2C4B9), size: 16), // primary-fixed
                    const SizedBox(width: 8),
                    Text(
                      'Analyzed $totalAnalysed ingredient interactions',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: const Color(0xFFD2C4B9).withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 3. FORMULA BREAKDOWN SECTION
// ==========================================
class _FormulaBreakdownSection extends StatelessWidget {
  final AnalysisResult result;

  const _FormulaBreakdownSection({required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Formula Breakdown',
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF675D53), // primary
              ),
            ),
            Row(
              children: [
                Text(
                  'VIEW ALL',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF7E756E), // outline
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xFF7E756E)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        
        // Active Heroes
        _GlassCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.stars, color: Color(0xFF675D53), size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'ACTIVE HEROES',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      color: const Color(0xFF675D53),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: result.keyActives.map((i) => _Chip(label: i.name)).toList(),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        Row(
          children: [
            // Caution Watchlist
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFDAD6).withValues(alpha: 0.2), // error-container
                  border: Border.all(color: const Color(0xFFBA1A1A).withValues(alpha: 0.1)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.warning, color: Color(0xFFBA1A1A), size: 12),
                        const SizedBox(width: 6),
                        Text(
                          'CAUTION',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: const Color(0xFFBA1A1A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (result.potentialIrritants.isEmpty)
                      Text('None', style: GoogleFonts.inter(fontSize: 14, color: const Color(0xFF93000A).withValues(alpha: 0.8))),
                    ...result.potentialIrritants.map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(e.name, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: const Color(0xFF93000A).withValues(alpha: 0.8))),
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            
            // Fillers/Base
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFEEEB).withValues(alpha: 0.5), // surface-container
                  border: Border.all(color: const Color(0xFFE3E2E0).withValues(alpha: 0.5)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.layers, color: Color(0xFF7E756E), size: 12),
                        const SizedBox(width: 6),
                        Text(
                          'BASE',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: const Color(0xFF7E756E),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: const [
                        _MinimalistChip(label: 'WATER'),
                        _MinimalistChip(label: 'GLYCERIN'),
                      ],
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

class _GlassCard extends StatelessWidget {
  final Widget child;

  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: child,
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;

  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF675D53).withValues(alpha: 0.05),
        border: Border.all(color: const Color(0xFF675D53).withValues(alpha: 0.1)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF675D53),
        ),
      ),
    );
  }
}

class _MinimalistChip extends StatelessWidget {
  final String label;

  const _MinimalistChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: const Color(0xFFD0C4BC), // outline-variant
      ),
    );
  }
}

// ==========================================
// 4. PREMIUM RITUAL SECTION
// ==========================================
class _ProTipCard extends StatefulWidget {
  final String recommendation;

  const _ProTipCard({required this.recommendation});

  @override
  State<_ProTipCard> createState() => _ProTipCardState();
}

class _ProTipCardState extends State<_ProTipCard> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xFFFDD4C0), // secondary-container
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Animated shimmer background
          AnimatedBuilder(
            animation: _shimmerController,
            builder: (context, child) {
              return Positioned.fill(
                child: FractionalTranslation(
                  translation: Offset((_shimmerController.value * 4) - 2, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white.withValues(alpha: 0.4),
                          Colors.transparent,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         const Icon(Icons.star_border, size: 14, color: Color(0xFF5C4131)),
                         const SizedBox(width: 4),
                         Text(
                           'PRO TIP',
                           style: GoogleFonts.inter(
                             fontSize: 10,
                             fontWeight: FontWeight.bold,
                             letterSpacing: 2,
                             color: const Color(0xFF5C4131), // on-secondary-container
                           ),
                         ),
                       ],
                     ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Better Together',
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF5C4131),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.recommendation.isNotEmpty 
                    ? widget.recommendation 
                    : 'Apply this serum while your skin is damp to enhance the Hyaluronic Acid absorption by up to 30%.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF5C4131).withValues(alpha: 0.7),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// 5. ACTION BUTTON
// ==========================================
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.text,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF675D53) : Colors.white,
          border: isPrimary ? null : Border.all(color: const Color(0xFF675D53).withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(100),
          boxShadow: isPrimary
              ? [BoxShadow(color: const Color(0xFF675D53).withValues(alpha: 0.2), blurRadius: 16)]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isPrimary ? Colors.white : const Color(0xFF675D53),
              ),
            ),
            if (isPrimary) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 18, color: Colors.white),
            ] else ...[
              const SizedBox(width: 8),
              Icon(icon, size: 20, color: const Color(0xFF675D53)),
            ],
          ],
        ),
      ),
    );
  }
}
