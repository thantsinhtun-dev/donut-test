import 'package:material_ui/material_ui.dart';

import '../../domain/entities/home_content.dart';

import '../../../../core/theme/app_theme.dart';
import 'orange_badge.dart';
import 'home_data_image.dart';

class SeasonalSpecialsList extends StatelessWidget {
  const SeasonalSpecialsList({required this.products, super.key});

  final List<HomeProduct> products;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 154,
    child: ListView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      children: [
        for (var index = 0; index < products.length; index++) ...[
          if (index > 0) const SizedBox(width: 10),
          _SeasonalCard(product: products[index]),
        ],
      ],
    ),
  );
}

class _SeasonalCard extends StatelessWidget {
  const _SeasonalCard({required this.product});

  final HomeProduct product;

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
                  HomeDataImage(
                    imageUrl: product.imageUrl,
                    fallbackAsset: product.fallbackAsset,
                  ),
                  if (product.discountPercent != null || product.isNew)
                    Positioned(
                      right: 7,
                      bottom: 7,
                      child: OrangeBadge(
                        text: product.discountPercent != null
                            ? '${product.discountPercent}% off'
                            : 'New',
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            product.name,
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
