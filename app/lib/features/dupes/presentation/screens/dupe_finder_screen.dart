import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DupeFinderScreen extends StatelessWidget {
  const DupeFinderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Minimal TopAppBar mimicking the nav in HTML
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFE9E8E5), // surface-container-high
                          image: const DecorationImage(
                            image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBrehE279Aq_bFJ6VjXO9XQ9qELkTK44n2RtwSSlVshQV4UbbeCTExks8aqkbAKVujbxO_yi6EqWvyJYRajAu0UcSzGz0AGGB5pc9y1YWqAnLvw2sbuJLtkQSF4xDlHzwfq_EfP14C6osMKgxHnPKhP6hArkkMuNwcYyIyuwRw_najPl-se4-2hnWzXdsO_pRWraD3vMQYBCf7cC2yhx9VIYSIoAOW8bscQTAfi9UOr8svzds05oz5eZUC2Nr98uc4EQRY_-fh4x6sf'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        'SkinSeek',
                        style: GoogleFonts.manrope(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF675D53), // primary
                          letterSpacing: -1.0,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Color(0xFF675D53)),
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
                        // Header Section
                        Text(
                          'Dupe Finder',
                          style: GoogleFonts.manrope(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF675D53), // primary
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Find affordable alternatives with identical active ingredients.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFF4D453F), // on-surface-variant
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Search Component
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9E8E5), // surface-container-high
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 20, right: 12),
                                child: Icon(Icons.search, color: Color(0xFF7E756E), size: 24),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Search luxury product or ingredient...',
                                    hintStyle: GoogleFonts.inter(
                                      color: const Color(0xFF7E756E).withValues(alpha: 0.6),
                                      fontSize: 15,
                                    ),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF675D53), // primary
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.filter_list, color: Colors.white, size: 20),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 48),

                        // Matches Label
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Top Matches For You',
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF675D53),
                              ),
                            ),
                            Text(
                              '48 DUPES FOUND',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.5,
                                color: const Color(0xFF7E756E),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // List of Cards
                        const _DupeComparisonCard(
                          originalName: 'Celestial Silk Serum',
                          originalPrice: '£124.00',
                          originalImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBe4mw7lYPcd_FgmrTgR5CxfOsZuwX7pXqj7tpMe8whB_WXKe8-kiplBFeSpwAYzuHIAy2q-nUPkY7Ua-ayNKAf-ELBgJ8SBaa600AOXot2q0_rH4R0XUZQ7ZCiHtERRX7U3k5QOhZVeHWP1KZ0zPbFFl_Xl3pXBZ8J4xYiHmxwiZwnseYwwOblABza5WHFWsCEeRXuFyof07aN0BswGiHrUXrqYHhOQAygCHV37NGacRVMGZlZ92Qml5VF_q1KlHmEz-ErWCxF_GSj',
                          matchLabel: 'Perfect Match',
                          dupeName: 'Radiance Essence B5',
                          dupePrice: '£18.50',
                          dupeImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCeoN5IUbEKcT8pCR6dU4zbsyo4S0TptsjK-9AlkpzaZS2Li6CEduj2FkBc0ebC73Owmiipdyk71ciL19oRc1tvJQv1P3M2wLaVJFnTKlrVILTJyVQmCF7UDkVsHUbpAHDh6Mx4BnNU_vr_E-dPTUCd4ZkF307Mri71GskMgl_2Z7Gj3knVPeOUPjJ2Tdptmje1slkhp9nUt1jq_nTiYTh1-WiT34qOQt5Ol4hd570te2W3DmsF9PZaC1_BIlwDbqr7EATUpWx1m3yW',
                          savedAmount: '£105.50',
                          justification: 'Both products share 92% ingredient bio-similarity, including the hero 5% Niacinamide and 2% Hyaluronic Acid complex.',
                        ),
                        const SizedBox(height: 24),
                        const _DupeComparisonCard(
                          originalName: 'Bio-Active Creme',
                          originalPrice: '£88.00',
                          originalImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCp55mf8yyOCQbptF_9wT6LvTS8fS3haUPIiJnbNHbs1JIYQjvETWtCCXCf8osTel1GzCt5O2dVx4Fm7yoa-NU7q_oriH3fEYKOH6Hw-eXNivkuAhgu-g1QqCql3Yq0PHp9YQxBIBwCHRVShtePW3AMjc4-zfpzzp8yG3vUWaT72tJn8g8_akeafTteDFrebBgBjhjXFJfJ8HMQvhrJPuxdin8TK1tjVSbqSd2cz9AjvFbsqU0TfBaxi1iKjj6dAOijPr_aYiOzKYCm',
                          matchLabel: '95% Match',
                          dupeName: 'Hydro-Boost Gel',
                          dupePrice: '£12.99',
                          dupeImageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAgm7AosCODUE5jcf_v4FE7aLzEvBxCNS5hiv-L1jvuuXFxoAEIK4AOw-qve0fzFfc0PAZ7lClfdpTIYMQpAyB-BinvoGlIFcUkG0iFUiywSzgqok3QYX4a55a6yMUJcGMigwnbPnGE14bMIhUx0nNagXt8_J5_UFGFR2TjIb35SNIe2UZRhhDnzjBa_KRsf-9cP8v1spijs0RAPU02lfDV-yk7ck-xaznoJIBUByvHQxmnUWF0jXVuG0H81k-jfIZzMk-qGlEeC7sc',
                          savedAmount: '£75.01',
                          justification: 'Uses the same proprietary algae extract and peptide base as the premium version, without the added fragrance.',
                        ),

                        const SizedBox(height: 48),

                        // Load More Button
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF5E6DA), // primary-container
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Load More Discoveries',
                              style: GoogleFonts.manrope(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF71665D), // on-primary-container
                              ),
                            ),
                          ),
                        ),

                        // Bottom Navigation padding compensation
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

class _DupeComparisonCard extends StatelessWidget {
  final String originalName;
  final String originalPrice;
  final String originalImageUrl;
  final String matchLabel;
  final String dupeName;
  final String dupePrice;
  final String dupeImageUrl;
  final String savedAmount;
  final String justification;

  const _DupeComparisonCard({
    required this.originalName,
    required this.originalPrice,
    required this.originalImageUrl,
    required this.matchLabel,
    required this.dupeName,
    required this.dupePrice,
    required this.dupeImageUrl,
    required this.savedAmount,
    required this.justification,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF675D53).withValues(alpha: 0.04), // preset shadow
            blurRadius: 40,
            offset: const Offset(0, 40),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Original Luxury Product Header
            Row(
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F3F1),
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(originalImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LUXURY ORIGINAL',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: const Color(0xFF735C00), // tertiary
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      originalName,
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF675D53), // primary
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      originalPrice,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7E756E), // outline
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 24),

            // Dividing Header
            Row(
              children: [
                Expanded(child: Container(height: 1, color: const Color(0xFFD0C4BC).withValues(alpha: 0.3))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F3F1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    matchLabel.toUpperCase(),
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      color: const Color(0xFF7E756E),
                    ),
                  ),
                ),
                Expanded(child: Container(height: 1, color: const Color(0xFFD0C4BC).withValues(alpha: 0.3))),
              ],
            ),

            const SizedBox(height: 24),

            // Dupe Product
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F3F1),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: NetworkImage(dupeImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF675D53),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          'DUPE',
                          style: GoogleFonts.inter(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BEST ALTERNATIVE',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: const Color(0xFF675D53),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dupeName.replaceAll(' ', '\n'), // Slight hack since UI shows wrapping
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1A1C1A),
                              height: 1.1,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            dupePrice,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF675D53),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5E6DA), // primary-container
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'YOU SAVE',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: -0.5,
                                color: const Color(0xFF71665D).withValues(alpha: 0.7),
                              ),
                            ),
                            Text(
                              savedAmount,
                              style: GoogleFonts.manrope(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF71665D),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Justification Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F3F1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.auto_fix_high, color: Color(0xFF735C00), size: 20),
                  const SizedBox(width: 16),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF4D453F),
                          height: 1.6,
                        ),
                        children: [
                          const TextSpan(text: 'Why it\'s a match: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A1C1A))),
                          TextSpan(text: justification),
                        ],
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
