import 'package:material_ui/material_ui.dart';

import 'product_carousel.dart';

class HomeProductSection extends StatelessWidget {
  const HomeProductSection({required this.popular, super.key});

  final bool popular;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  popular ? 'Popular 🔥' : 'Order again',
                  style: const TextStyle(
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
          ProductCarousel(popular: popular),
        ],
      ),
    );
  }
}
