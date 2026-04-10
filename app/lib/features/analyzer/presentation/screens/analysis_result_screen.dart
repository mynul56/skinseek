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
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFFFAF9F6),
            flexibleSpace: FlexibleSpaceBar(
              background: _HeaderBackground(score: result.safetyScore),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF675D53)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Analysis Complete',
                    style: GoogleFonts.manrope(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF675D53),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    result.summary,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: const Color(0xFF4D453F).withValues(alpha: 0.8),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                  if (result.keyActives.isNotEmpty) ...[
                    _SectionTitle(title: 'Key Actives', icon: Icons.verified),
                    const SizedBox(height: 16),
                    ...result.keyActives.map((insight) => _InsightItem(
                          insight: insight,
                          isPositive: true,
                        )),
                    const SizedBox(height: 32),
                  ],
                  if (result.potentialIrritants.isNotEmpty) ...[
                    _SectionTitle(title: 'Potential Irritants', icon: Icons.warning_amber),
                    const SizedBox(height: 16),
                    ...result.potentialIrritants.map((insight) => _InsightItem(
                          insight: insight,
                          isPositive: false,
                        )),
                    const SizedBox(height: 32),
                  ],
                  _SectionTitle(title: 'Final Verdict', icon: Icons.gavel),
                  const SizedBox(height: 16),
                  _VerdictCard(
                    comedogenicRating: result.comedogenicRating,
                    recommendation: result.recommendation,
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  final double score;

  const _HeaderBackground({required this.score});

  @override
  Widget build(BuildContext context) {
    final color = score >= 7 ? const Color(0xFF5D7B6F) : (score >= 4 ? const Color(0xFFE9C349) : const Color(0xFFBA1A1A));

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.1),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
              child: Container(color: Colors.transparent),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              'SAFETY SCORE',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                color: const Color(0xFF675D53).withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  score.toStringAsFixed(1),
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 72,
                    fontWeight: FontWeight.bold,
                    height: 1,
                    color: color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0, left: 4.0),
                  child: Text(
                    '/10',
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF675D53).withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF735C00), size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF675D53),
          ),
        ),
      ],
    );
  }
}

class _InsightItem extends StatelessWidget {
  final IngredientInsight insight;
  final bool isPositive;

  const _InsightItem({required this.insight, required this.isPositive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPositive
              ? const Color(0xFF5D7B6F).withValues(alpha: 0.2)
              : const Color(0xFFBA1A1A).withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isPositive
                  ? const Color(0xFF5D7B6F).withValues(alpha: 0.1)
                  : const Color(0xFFBA1A1A).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isPositive ? Icons.check : Icons.warning_rounded,
              color: isPositive ? const Color(0xFF5D7B6F) : const Color(0xFFBA1A1A),
              size: 16,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  insight.name,
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1C1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  insight.benefit ?? insight.reason ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF4D453F),
                    height: 1.4,
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

class _VerdictCard extends StatelessWidget {
  final String comedogenicRating;
  final String recommendation;

  const _VerdictCard({
    required this.comedogenicRating,
    required this.recommendation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF5E6DA), Color(0xFFE6BEAA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.15),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.water_drop_outlined, color: Color(0xFF765847), size: 20),
              const SizedBox(width: 8),
              Text(
                'Comedogenic Rating',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF4E453C),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            comedogenicRating,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2B160A),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: Colors.white54),
          ),
          Text(
            'Recommendation',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4E453C),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            recommendation,
            style: GoogleFonts.inter(
              fontSize: 15,
              color: const Color(0xFF2B160A),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
