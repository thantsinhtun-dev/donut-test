import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/home_content.dart';
import 'home_data_image.dart';

class MemberHeader extends StatelessWidget {
  const MemberHeader({required this.member, super.key});

  final MemberProfile member;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: HomeDataImage(
                  imageUrl: member.avatarUrl,
                  fallbackAsset: member.fallbackAsset,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: const TextStyle(
                      color: AppTheme.ink,
                      fontSize: 22,
                      height: 1.1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    member.tier,
                    style: const TextStyle(
                      color: Color(0xFF7F858D),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFFF7D19),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 17,
                  ),
                  const SizedBox(width: 3),
                  if (member.notifications > 0)
                    CircleAvatar(
                      radius: 7,
                      backgroundColor: Colors.white,
                      child: Text(
                        '${member.notifications}',
                        style: const TextStyle(
                          color: Color(0xFFFF7D19),
                          fontSize: 8,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 9),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '${member.pointsToNextTier} points left to become ${member.nextTierName} Member',
            style: const TextStyle(color: Color(0xFF747A82), fontSize: 8),
          ),
        ),
      ],
    );
  }
}
