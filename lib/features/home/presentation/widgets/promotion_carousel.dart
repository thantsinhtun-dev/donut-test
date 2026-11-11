import 'package:material_ui/material_ui.dart';

import '../../domain/entities/home_content.dart';
import 'home_data_image.dart';

class PromotionCarousel extends StatelessWidget {
  const PromotionCarousel({required this.banners, super.key});

  final List<HomeBanner> banners;

  @override
  Widget build(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width - 76;

    return SizedBox(
      height: 136,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: banners.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: HomeDataImage(
            imageUrl: banners[index].imageUrl,
            fallbackAsset: banners[index].fallbackAsset,
            width: cardWidth,
            height: 136,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
