import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: AppTheme.ink,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          width: 22,
          height: 22,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.chevron_right, size: 17, color: AppTheme.ink),
        ),
      ],
    );
  }
}
