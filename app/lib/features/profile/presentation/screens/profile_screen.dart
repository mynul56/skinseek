import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skinseek_app/core/theme/app_theme.dart';
import 'package:skinseek_app/features/setup/data/models/skin_profile.dart';
import 'package:skinseek_app/features/setup/presentation/riverpod/setup_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setupState = ref.watch(setupNotifierProvider);
    final profile = setupState.profile;
    final userName = profile.isCompleted ? 'Mynul' : 'Explorer';

    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 120),
        child: Column(
          children: [
            const _ProfileHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  _UserInfoSection(userName: userName),
                  const SizedBox(height: 32),
                  _SkinInsightsGrid(profile: profile),
                  const SizedBox(height: 24),
                  const _SubscriptionCard(),
                  const SizedBox(height: 32),
                  const _AccountSettingsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
      height: 124,
      decoration: BoxDecoration(color: const Color(0xFFFAF9F6).withOpacity(0.7)),
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
                  border: Border.all(color: const Color(0xFFF5E6DA), width: 2),
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuCEkQLyngqpnFcFg77-2LuOTdyX5zpON_uBouhKuRR9qm3qQUgoRN2VXa4LAohlNqpNXd8aOB1MWlszlNlFTov-Tjz8TixoqzpCjSc80Zp4_agi9CEVgFWwrqkoMDwAlqi3huNsAwUmPxD9QXmXVrGW9PAMS6akhFRii2blE0fymZJbqZyMz-5Xu0ZB9DASF00HFDtd8fqruvOhQLuQPSL2wQzdcXpe2awpYms0t2gpj9PszaAIsNOxztqe_hUdA1lk2JSrcWsEsteM',
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
                  color: AppTheme.splashPrimary,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          const Icon(Icons.notifications_outlined, color: Color(0xFF675D53)),
        ],
      ),
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  final String userName;
  const _UserInfoSection({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 40, offset: const Offset(0, 20))],
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuAKU-grIB1i1oZ2qCa0eqxgLXG_ZKy_X2yDsnPhNGtNq11xpbBZMOYZnd2_0C0C8W-tvnCAelHWZ8AAJUFrkXs6VSa8E20nQpV9-f30NumhO2KPrdfjqaRuW_fz0Pyr4OqCMx2SkTlo0cLRrikC2crkBhIhU8D-u8co5WxoME4PUMmOMRqKsJiwzLaH5shOgz7UaBVmEtWtzw1V1ovROdcYW8LrbA1hN5x_sa6fo0b6FdZa5GecDzT8CJiZ14DhTrbOU2rYqkjOfv7Z',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Color(0xFFF5E6DA), Color(0xFF675D53)]),
              ),
              child: const Icon(Icons.verified, color: Colors.white, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          userName,
          style: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w800, color: AppTheme.splashPrimary),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(color: const Color(0xFFFFE7A8), borderRadius: BorderRadius.circular(100)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: Color(0xFF735C00), size: 14),
              const SizedBox(width: 4),
              Text(
                'PREMIUM MEMBER',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                  color: const Color(0xFF7F6500),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SkinInsightsGrid extends StatelessWidget {
  final SkinProfile profile;
  const _SkinInsightsGrid({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _InsightCard(
            label: 'MY SKIN TYPE',
            value: profile.skinType?.upperLabel ?? 'NONE',
            description: 'Balanced with focus on T-zone.',
            icon: Icons.water_drop,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _InsightCard(
            label: 'PRIMARY CONCERNS',
            content: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: profile.concerns.isEmpty
                  ? [Text('None', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500))]
                  : profile.concerns
                        .take(2)
                        .map(
                          (c) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFEEEB),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(c.titleLabel, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w500)),
                          ),
                        )
                        .toList(),
            ),
            icon: Icons.flare,
            isUpdateable: true,
          ),
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? content;
  final String? description;
  final IconData icon;
  final bool isUpdateable;

  const _InsightCard({
    required this.label,
    this.value,
    this.content,
    this.description,
    required this.icon,
    this.isUpdateable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 40, offset: const Offset(0, 20))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: AppTheme.splashOnSurfaceVariant.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 8),
          if (value != null)
            Text(
              value!,
              style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.splashPrimary),
            ),
          if (content != null) content!,
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (description != null)
                Expanded(
                  child: Text(
                    description!,
                    style: GoogleFonts.inter(fontSize: 11, color: AppTheme.splashOnSurfaceVariant.withOpacity(0.6)),
                  ),
                ),
              if (isUpdateable)
                Text(
                  'Update >',
                  style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.splashPrimary),
                ),
              Icon(icon, color: AppTheme.splashPrimary.withOpacity(0.1), size: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF5E6DA), Color(0xFFEFD4C0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -40,
            top: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SkinSeek Pro',
                style: GoogleFonts.manrope(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.splashPrimary),
              ),
              const SizedBox(height: 8),
              Text(
                'Unlimited AI scans and\ndermatologist-curated routines.',
                style: GoogleFonts.inter(fontSize: 14, color: AppTheme.splashOnSurfaceVariant, height: 1.5),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.splashPrimary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                ),
                child: const Text('Manage Subscription'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountSettingsList extends StatelessWidget {
  const _AccountSettingsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ACCOUNT SETTINGS',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: AppTheme.splashOnSurfaceVariant.withOpacity(0.5),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              _SettingTile(icon: Icons.person_outline, title: 'Personal Information', onTap: () {}),
              const Divider(height: 1, indent: 64),
              _SettingTile(icon: Icons.history, title: 'Analysis History', onTap: () {}),
              const Divider(height: 1, indent: 64),
              _SettingTile(icon: Icons.shield_outlined, title: 'Privacy & Security', onTap: () {}),
              const Divider(height: 1, indent: 64),
              _SettingTile(icon: Icons.logout, title: 'Logout', onTap: () {}, isDestructive: true),
            ],
          ),
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isDestructive;

  const _SettingTile({required this.icon, required this.title, required this.onTap, this.isDestructive = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Color(0xFFFAF9F6), shape: BoxShape.circle),
        child: Icon(icon, color: isDestructive ? Colors.red : AppTheme.splashPrimary, size: 20),
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isDestructive ? Colors.red : AppTheme.splashPrimary,
        ),
      ),
      trailing: isDestructive ? null : const Icon(Icons.chevron_right, color: Color(0xFFD0C4BC), size: 20),
    );
  }
}
