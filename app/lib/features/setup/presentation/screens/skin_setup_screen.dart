import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';

class SkinSetupScreen extends StatefulWidget {
  const SkinSetupScreen({super.key});

  @override
  State<SkinSetupScreen> createState() => _SkinSetupScreenState();
}

class _SkinSetupScreenState extends State<SkinSetupScreen> {
  String? _selectedType = 'Combination'; // Default selection from UI

  final List<SkinTypeModel> _skinTypes = [
    SkinTypeModel(
      id: 'dry',
      title: 'Dry',
      description: 'Feels tight, shows fine lines, or has flaky patches.',
      icon: Icons.water_drop_outlined,
      color: const Color(0xFFF5E6DA),
    ),
    SkinTypeModel(
      id: 'oily',
      title: 'Oily',
      description: 'Visible pores and persistent shine throughout the day.',
      icon: Icons.opacity_outlined,
      color: const Color(0xFFFDD4C0),
    ),
    SkinTypeModel(
      id: 'combination',
      title: 'Combination',
      description: 'Oily in the T-zone (forehead, nose, chin) and dry or normal on cheeks.',
      isFeatured: true,
      badge: 'Most Common',
      icon: Icons.balance_outlined,
      color: const Color(0xFF675D53),
    ),
    SkinTypeModel(
      id: 'normal',
      title: 'Normal',
      description: 'Balanced moisture levels with few imperfections.',
      icon: Icons.face_outlined,
      color: const Color(0xFFE9E8E5),
    ),
    SkinTypeModel(
      id: 'sensitive',
      title: 'Sensitive',
      description: 'Easily irritated by products, weather, or touch.',
      icon: Icons.auto_fix_high_outlined,
      color: const Color(0xFFFFDAD6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashGradientStart,
      body: Stack(
        children: [
          // Ambient Background Decorations
          Positioned(
            top: -100,
            right: -100,
            child: _BlurredCircle(
              size: 384,
              color: AppTheme.splashAmbient1.withOpacity(0.2),
              blur: 100,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.4,
            left: -180,
            child: _BlurredCircle(
              size: 384,
              color: AppTheme.splashAmbient2.withOpacity(0.1),
              blur: 120,
            ),
          ),

          // Main Content
          SafeArea(
            child: Column(
              children: [
                // Glassmorphic Header
                _SetupHeader(
                  avatarUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBTOamVTzbOHO4sVjqD9btNU6u7d2IC77-5Xu7YXz0ucDuxjuSd1UXYxwrU9IdYYqCG33071EWKLteziANkqaa9wZqxCZnred6e0GLqaC6Tc1A8hfYYN7BKQEvRSlB2wSgteqkyB1Sbd1FfXIGbX65UnHhdoeXvWycfa9-m9M0WNxpJXZRKrRm6ESZMCS5rajyGhLsBSPpKYFMIS1Sb8KVf69YsfwIwTwhMRiGYYEGMP3DsoOZ6Z8_CH1DEaul-gK92pWAztz-8sh07',
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progress Indicator
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: AppTheme.authSurfaceContainerHigh,
                                  borderRadius: BorderRadius.circular(double.infinity),
                                ),
                                child: FractionalTranslation(
                                  translation: const Offset(0, 0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.15, // Step 1
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                                        ),
                                        borderRadius: BorderRadius.circular(double.infinity),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'STEP 1 OF 6',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                                color: AppTheme.splashPrimary.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        // Section Header
                        Text(
                          'What\'s your skin type?',
                          style: GoogleFonts.manrope(
                            fontSize: 36,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -1.5,
                            color: AppTheme.splashPrimary,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Knowing your skin type helps our AI customize your analysis and recommendations.',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Bento Grid Selection
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: 2, // Dry, Oily
                          itemBuilder: (context, index) => _SkinTypeCard(
                            model: _skinTypes[index],
                            isSelected: _selectedType == _skinTypes[index].title,
                            onTap: () => setState(() => _selectedType = _skinTypes[index].title),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _SkinTypeCard(
                          model: _skinTypes[2], // Combination (Featured)
                          isSelected: _selectedType == _skinTypes[2].title,
                          onTap: () => setState(() => _selectedType = _skinTypes[2].title),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: 2, // Normal, Sensitive
                          itemBuilder: (context, index) => _SkinTypeCard(
                            model: _skinTypes[index + 3],
                            isSelected: _selectedType == _skinTypes[index + 3].title,
                            onTap: () => setState(() => _selectedType = _skinTypes[index + 3].title),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Insight Box
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: AppTheme.authSurfaceContainerHigh.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                            border: const Border(
                              left: BorderSide(color: Color(0xFF735C00), width: 4),
                            ),
                          ),
                          child: Text(
                            '"Finding your baseline is the first step toward skin-confidence. Skin types can change seasonally—choose what feels most accurate today."',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: AppTheme.splashOnSurfaceVariant.withOpacity(0.8),
                              height: 1.5,
                            ),
                          ),
                        ),

                        const SizedBox(height: 120), // Bottom padding for button
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppTheme.splashGradientStart,
                    AppTheme.splashGradientStart.withOpacity(0.9),
                    AppTheme.splashGradientStart.withOpacity(0),
                  ],
                ),
              ),
              child: Row(
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back, color: AppTheme.splashPrimary),
                    label: Text(
                      'Back',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.splashPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Step 2
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF5E6DA), Color(0xFF675D53)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(double.infinity),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.splashPrimary.withOpacity(0.15),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Text(
                        'Continue',
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Paper Texture
          IgnorePointer(
            child: Opacity(
              opacity: 0.1,
              child: Image.network(
                'https://www.transparenttextures.com/patterns/natural-paper.png',
                repeat: ImageRepeat.repeat,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SetupHeader extends StatelessWidget {
  final String avatarUrl;

  const _SetupHeader({required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF9F6).withOpacity(0.7),
      ),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(avatarUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'SkinSeek',
                style: GoogleFonts.manrope(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                  color: AppTheme.splashPrimary,
                ),
              ),
              const Icon(Icons.notifications_outlined, color: AppTheme.splashPrimary),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkinTypeCard extends StatelessWidget {
  final SkinTypeModel model;
  final bool isSelected;
  final VoidCallback onTap;

  const _SkinTypeCard({
    required this.model,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (model.isFeatured) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected ? AppTheme.splashPrimary : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 40,
                offset: const Offset(0, 40),
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(colors: [Color(0xFFF5E6DA), Color(0xFF675D53)])
                          : null,
                      color: isSelected ? null : model.color.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      model.icon,
                      color: isSelected ? Colors.white : AppTheme.splashPrimary,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Text(
                              model.title,
                              style: GoogleFonts.manrope(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.splashPrimary,
                              ),
                            ),
                            if (model.badge != null) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE7A8),
                                  borderRadius: BorderRadius.circular(double.infinity),
                                ),
                                child: Text(
                                  model.badge!,
                                  style: GoogleFonts.inter(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w900,
                                    color: const Color(0xFF7F6500),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          model.description,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (isSelected)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppTheme.splashPrimary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check, color: Colors.white, size: 12),
                  ),
                ),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppTheme.splashPrimary : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 40,
              offset: const Offset(0, 40),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: model.color.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(model.icon, color: AppTheme.splashPrimary, size: 24),
                ),
                const Spacer(),
                Text(
                  model.title,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.splashPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  model.description,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppTheme.splashOnSurfaceVariant.withOpacity(0.7),
                    height: 1.3,
                  ),
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: AppTheme.splashPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class SkinTypeModel {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final bool isFeatured;
  final String? badge;

  SkinTypeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.isFeatured = false,
    this.badge,
  });
}

class _BlurredCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double blur;

  const _BlurredCircle({
    required this.size,
    required this.color,
    required this.blur,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}
