import 'package:material_ui/material_ui.dart';

import '../../domain/entities/home_content.dart';

import 'seasonal_specials_list.dart';

class SeasonalSpecialsSection extends StatelessWidget {
  const SeasonalSpecialsSection({
    required this.section,
    required this.products,
    super.key,
  });

  final HomeSection section;
  final List<HomeProduct> products;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  section.title,
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
          SeasonalSpecialsList(products: products),
        ],
      ),
    );
  }
}
