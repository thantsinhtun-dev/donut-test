import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import 'orange_badge.dart';
import '../../domain/entities/home_content.dart';
import 'home_data_image.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({required this.products, super.key});

  final List<HomeProduct> products;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 168,
    child: ListView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      children: [
        for (var index = 0; index < products.length; index++) ...[
          if (index > 0) const SizedBox(width: 10),
          _ProductCard(
            product: products[index],
            onTap: () =>
                context.push(AppRoutes.product, extra: products[index]),
          ),
        ],
      ],
    ),
  );
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product, required this.onTap});

  final HomeProduct product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(13),
      child: SizedBox(
        width: 116,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(color: Colors.white),
                    HomeDataImage(
                      imageUrl: product.imageUrl,
                      fallbackAsset: product.fallbackAsset,
                    ),
                    if (product.discountPercent != null || product.isNew)
                      Positioned(
                        right: 6,
                        bottom: 6,
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
            const SizedBox(height: 7),
            Text(
              product.name,
              style: const TextStyle(
                color: AppTheme.ink,
                fontSize: 9,
                height: 1.15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${_formatPrice(product.priceMmk)} MMK',
              style: const TextStyle(color: Color(0xFF777D85), fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatPrice(int price) {
  final digits = price.toString();
  final formatted = digits.replaceAllMapped(
    RegExp(r'\B(?=(\d{3})+(?!\d))'),
    (_) => ',',
  );
  return formatted;
}
