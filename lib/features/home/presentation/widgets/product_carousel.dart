import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import 'orange_badge.dart';

class ProductCarousel extends StatelessWidget {
  const ProductCarousel({required this.popular, super.key});

  final bool popular;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 168,
    child: ListView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      children: [
        _ProductCard(
          name: popular
              ? 'Strawberry\nChocolate Donuts'
              : "Santa’s favorite\ncookies set",
          price: popular ? '3,200 MMK' : '20% off',
          alignment: Alignment.center,
          onTap: () => context.push(AppRoutes.product),
        ),
        const SizedBox(width: 10),
        _ProductCard(
          name: popular
              ? 'Dalgona Creamy\nCoffee'
              : "Santa’s favorite\ncookies set",
          price: popular ? '2,500 MMK' : '20% off',
          alignment: Alignment.topLeft,
          onTap: () => context.push(AppRoutes.product),
        ),
        const SizedBox(width: 10),
        _ProductCard(
          name: popular ? 'Sprinkle Donut' : 'Holiday donut box',
          price: popular ? '1,800 MMK' : '15% off',
          alignment: Alignment.bottomRight,
          onTap: () => context.push(AppRoutes.product),
        ),
      ],
    ),
  );
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({
    required this.name,
    required this.price,
    required this.alignment,
    required this.onTap,
  });

  final String name;
  final String price;
  final Alignment alignment;
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
                    Image.asset(
                      'assets/images/onboarding_donut.png',
                      fit: BoxFit.cover,
                      alignment: alignment,
                    ),
                    if (price.contains('%'))
                      Positioned(
                        right: 6,
                        bottom: 6,
                        child: OrangeBadge(text: price),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              name,
              style: const TextStyle(
                color: AppTheme.ink,
                fontSize: 9,
                height: 1.15,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!price.contains('%'))
              Text(
                price,
                style: const TextStyle(color: Color(0xFF777D85), fontSize: 8),
              ),
          ],
        ),
      ),
    );
  }
}
