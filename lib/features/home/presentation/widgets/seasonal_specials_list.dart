import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import 'orange_badge.dart';

class SeasonalSpecialsList extends StatelessWidget {
  const SeasonalSpecialsList({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 154,
    child: ListView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      children: const [
        _SeasonalCard(
          title: 'Mistletoe\nRomance box',
          badge: '50% off',
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        _SeasonalCard(
          title: 'Christmas Mini\nFamily box',
          badge: '',
          alignment: Alignment.topLeft,
        ),
        SizedBox(width: 10),
        _SeasonalCard(
          title: 'Sweet Treats\nDonut box',
          badge: 'New',
          alignment: Alignment.bottomRight,
        ),
      ],
    ),
  );
}

class _SeasonalCard extends StatelessWidget {
  const _SeasonalCard({
    required this.title,
    required this.badge,
    required this.alignment,
  });

  final String title;
  final String badge;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 154,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/onboarding_donut.png',
                    fit: BoxFit.cover,
                    alignment: alignment,
                  ),
                  if (badge.isNotEmpty)
                    Positioned(
                      right: 7,
                      bottom: 7,
                      child: OrangeBadge(text: badge),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.ink,
              fontSize: 10,
              height: 1.15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
