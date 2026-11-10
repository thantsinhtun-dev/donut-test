import 'package:material_ui/material_ui.dart';

import 'seasonal_specials_list.dart';

class SeasonalSpecialsSection extends StatelessWidget {
  const SeasonalSpecialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Seasonal specials',
                  style: TextStyle(
                    color: Color(0xFF292F38),
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
                child: const Icon(
                  Icons.chevron_right,
                  size: 17,
                  color: Color(0xFF292F38),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const SeasonalSpecialsList(),
        ],
      ),
    );
  }
}
