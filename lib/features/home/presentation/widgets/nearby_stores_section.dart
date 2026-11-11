import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/home_content.dart';
import 'home_data_image.dart';

class NearbyStoresSection extends StatelessWidget {
  const NearbyStoresSection({
    required this.section,
    required this.shops,
    super.key,
  });

  final HomeSection section;
  final List<HomeShop> shops;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/nearby_stores_background.png'),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              height: 1.16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'EXPLORE NOW',
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 9,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 158,
            child: ListView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              children: [
                for (var index = 0; index < shops.length; index++) ...[
                  if (index > 0) const SizedBox(width: 10),
                  _StoreCard(shop: shops[index]),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({required this.shop});

  final HomeShop shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: HomeDataImage(
                imageUrl: shop.imageUrl,
                fallbackAsset: shop.fallbackAsset,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            shop.name,
            style: const TextStyle(
              color: AppTheme.ink,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            shop.address,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF7F858D), fontSize: 8),
          ),
          Text(
            shop.actionLabel,
            style: const TextStyle(
              color: AppTheme.accent,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
