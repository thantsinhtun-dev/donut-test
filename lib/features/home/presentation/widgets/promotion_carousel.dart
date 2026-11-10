import 'package:material_ui/material_ui.dart';

class PromotionCarousel extends StatelessWidget {
  const PromotionCarousel({super.key});

  static const _promotionImages = [
    'assets/images/promotion_central_boulevard.png',
    'assets/images/promotion_hot_deals.png',
  ];

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width - 76;

    return SizedBox(
      height: 136,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: _promotionImages.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            _promotionImages[index],
            width: cardWidth,
            height: 136,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
