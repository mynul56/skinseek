import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6), // background
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Top Navigation Anchor
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
                              color: const Color(0xFFEFEEEB), // surface-container
                              image: const DecorationImage(
                                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAa9dl1t2mUBcSMN4LIWMatrAp7VjC0-RexeooL1qVc6LyIg3riEuubyu2hFPv5NW_o7dbYhgKjy34rXX8oJhZ6Ju_aY-PBKPuRb-vc73jObtD-j4OwDAe5PvekU8Sq30pu2pM6gFfIAc3ZioqdmC-gglR--XFEQ0hbS-CRus2dYbY-mJRfh6AWQZTMWpRVV2M_pDbrGyT_8jMGehmT9puJDHjDBdnS8f0rE6qG-xAOssLufxXCXc3K0eXrfqf5l2SNPW8AR99CtJAU'),
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
                              letterSpacing: -1.0,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.notifications, color: Color(0xFF675D53)),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Color(0xFF675D53)),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
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
                        // Search & Filter Section
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9E8E5), // surface-container-high
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Icon(Icons.search, color: Color(0xFF7E756E), size: 24), // on-surface-variant/50
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search history...',
                                    hintStyle: GoogleFonts.inter(
                                      color: const Color(0xFF7E756E).withValues(alpha: 0.6),
                                      fontSize: 15,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Filters
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF675D53).withValues(alpha: 0.15),
                                      blurRadius: 12,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'All Analysis',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              _FilterChip(label: 'Routine Fixes'),
                              const SizedBox(width: 12),
                              _FilterChip(label: 'Scan Results'),
                              const SizedBox(width: 12),
                              _FilterChip(label: 'Ingredients'),
                            ],
                          ),
                        ),

                        const SizedBox(height: 32),

                        // History List
                        // Entry 1
                        const _StandardHistoryCard(
                          date: '12 OCT 2023',
                          score: '94',
                          scoreColor: Color(0xFF735C00), // tertiary
                          title: 'Luminous Glow Serum',
                          description: 'Optimization focus: Hydration and texture refined via AI scan.',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCwkHFBA4PGzMQaQ3ClSUmVKc35VQeO8yedwz0Y9A75wttrBJHuU9xZXmkY76Ww1GQfTPI7sQkOo3tQ49AtY5rQdncHXn95ztZe_rZI5kAeVgY_CJudIGVaEGJzRktbnYn2XYrVlQpjctqjpnssOXTVIed2rknJxU4QhZqSXwO186JGoW4fV_Frh95Sug0ybFVV8jLwRIFLB1re1WOl5WoBiRBCIt_l1aIox37dDpyPMZJyEAwrX6iwRrU9EsbvZi3dRyoF3E62Iclv',
                        ),
                        const SizedBox(height: 16),

                        // Entry 2 (Asymmetric)
                        const _AsymmetricHistoryCard(
                          date: '05 OCT 2023',
                          score: '82',
                          scoreColor: Color(0xFF675D53), // primary
                          title: 'Night Recovery Complex',
                          description: 'Alert: Retinol concentration slightly high for current barrier status.',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAktGW-k0k5DvBOfI9l0ctkDAxAa5XKApRcGvhxGOJvU_pnDiKHIv2pEZZAnyP5fEE0PWv-SyWvPWAnGk45h_rKTTcJUPSx_mzMKQwoAFkd3Wi053kyWuye8abnpNqzsL1K4bjgHIARd0zDIXV5sz2Z0nnfFqJ_xhLWN961ex_NBzeDZPgebN44iADnybghFKxowgPUa9lvWxuoMAfyWDw4h16YrM9sU9e-RwxtH7GHJKTL_2p2kVFXZptfyTZekNQuRkA2GMeMwaLE',
                        ),
                        const SizedBox(height: 16),

                        // Entry 3
                        const _StandardHistoryCard(
                          date: '28 SEP 2023',
                          score: '88',
                          scoreColor: Color(0xFF735C00), // tertiary
                          title: 'Botanical Purifying Gel',
                          description: 'Analysis complete: pH balance verified for morning application.',
                          imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB55pNI-Pvuig3YEHMke4yZlleZRIhi5zMEhDvCyiBQb6zyYSQV4ErCVzfKp3XRfLfalPMISyd0QrBH7R4awsXTprlJTlIAIi3s-6BR5xQXXN1isCXrMnDwBD8TIh7UIIvPftwHESW8M56ZNVVqVyAXKQ0wzGBQhbktX6Gf0E0zJP-EQ5KSgdtMbda07ZS-tDlrzIeEw0HoL42jAMaDwoB6XH7o0jWmpXsFzDQB8StXMmkjBBtBymVV4x9inVZKIXDU4g42JcGnAQQi',
                        ),
                        const SizedBox(height: 16),

                        // Entry 4 (Icon standard card)
                        const _IconHistoryCard(
                          date: '15 SEP 2023',
                          score: '76',
                          scoreColor: Color(0xFF4D453F), // on-surface-variant
                          title: 'Full Facial Scan #04',
                          description: 'Detected sensitivity in t-zone. Personalized recommendations updated.',
                          icon: Icons.auto_fix_high,
                        ),

                        // Weekly Summary CTA (Bento Style)
                        const SizedBox(height: 48),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFF5E6DA), Color(0xFFE3E2E0)], // from primary-container to surface-variant
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black.withValues(alpha: 0.05)),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Skin Evolution Report',
                                    style: GoogleFonts.manrope(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: -0.5,
                                      color: const Color(0xFF71665D), // on-primary-container
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: 200,
                                    child: Text(
                                      'Your barrier health improved by 14% this month.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: const Color(0xFF71665D).withValues(alpha: 0.7),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      elevation: 8,
                                      shadowColor: Colors.black.withValues(alpha: 0.2),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'VIEW TRENDS',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                        color: const Color(0xFF675D53), // primary
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: -40,
                                bottom: -40,
                                child: Transform.rotate(
                                  angle: 12 * 3.14159 / 180, // rotate-12
                                  child: Icon(
                                    Icons.flare,
                                    size: 140,
                                    color: const Color(0xFF675D53).withValues(alpha: 0.1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Bottom Navigation padding correlation
                        const SizedBox(height: 100),
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

class _FilterChip extends StatelessWidget {
  final String label;

  const _FilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F1), // surface-container-low
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF4D453F), // on-surface-variant
        ),
      ),
    );
  }
}

class _StandardHistoryCard extends StatelessWidget {
  final String date;
  final String score;
  final Color scoreColor;
  final String title;
  final String description;
  final String imageUrl;

  const _StandardHistoryCard({
    required this.date,
    required this.score,
    required this.scoreColor,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white, // surface-container-lowest
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.08), // soft-glow
            blurRadius: 24,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF4D453F).withValues(alpha: 0.4),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          score,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: scoreColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'SCORE',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                            color: scoreColor.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1C1A), // on-surface
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF4D453F).withValues(alpha: 0.7),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AsymmetricHistoryCard extends StatelessWidget {
  final String date;
  final String score;
  final Color scoreColor;
  final String title;
  final String description;
  final String imageUrl;

  const _AsymmetricHistoryCard({
    required this.date,
    required this.score,
    required this.scoreColor,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16), // ml-4
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F3F1), // surface-container-low
        borderRadius: BorderRadius.circular(16),
        border: const Border(left: BorderSide(color: Color(0xFFF5E6DA), width: 2)), // border-l-2 border-primary-container
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF4D453F).withValues(alpha: 0.4),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          score,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: scoreColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'SCORE',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                            color: scoreColor.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1C1A), // on-surface
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF4D453F).withValues(alpha: 0.7),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconHistoryCard extends StatelessWidget {
  final String date;
  final String score;
  final Color scoreColor;
  final String title;
  final String description;
  final IconData icon;

  const _IconHistoryCard({
    required this.date,
    required this.score,
    required this.scoreColor,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white, // surface-container-lowest
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.08), // soft-glow
            blurRadius: 24,
            offset: const Offset(0, 0),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFF5E6DA).withValues(alpha: 0.3), // primary-container/20
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Icon(icon, color: const Color(0xFF675D53), size: 36),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF4D453F).withValues(alpha: 0.4),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          score,
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: scoreColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'SCORE',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.5,
                            color: scoreColor.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  title,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1A1C1A), // on-surface
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xFF4D453F).withValues(alpha: 0.7),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
