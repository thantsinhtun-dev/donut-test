import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';

class MemberHeader extends StatelessWidget {
  const MemberHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage('assets/images/member_avatar.png'),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hania',
                    style: TextStyle(
                      color: AppTheme.ink,
                      fontSize: 22,
                      height: 1.1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Bronze member',
                    style: TextStyle(color: Color(0xFF7F858D), fontSize: 10),
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
              child: const Row(
                children: [
                  Icon(Icons.notifications_none, color: Colors.white, size: 17),
                  SizedBox(width: 3),
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.white,
                    child: Text(
                      '2',
                      style: TextStyle(
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
          child: const Text(
            '1290 points left to become Gold Member',
            style: TextStyle(color: Color(0xFF747A82), fontSize: 8),
          ),
        ),
      ],
    );
  }
}
