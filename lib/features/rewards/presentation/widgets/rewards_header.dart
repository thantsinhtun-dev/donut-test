import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';

class RewardsHeader extends StatelessWidget {
  const RewardsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'J’ Donuts Rewards',
            style: TextStyle(
              color: AppTheme.ink,
              fontSize: 19,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFF7D19),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Text(
                'Rewards',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 5),
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.white,
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Color(0xFFFF7D19),
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
