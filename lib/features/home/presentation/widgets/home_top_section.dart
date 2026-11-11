import 'package:material_ui/material_ui.dart';

import '../../domain/entities/home_content.dart';

import 'member_header.dart';
import 'promotion_carousel.dart';

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({
    required this.member,
    required this.banners,
    super.key,
  });

  final MemberProfile member;
  final List<HomeBanner> banners;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.paddingOf(context).top + 14,
        20,
        0,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFFEBDD),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -34,
            top: 24,
            child: Container(
              width: 150,
              height: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/member_badge.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
              MemberHeader(member: member),
              const SizedBox(height: 14),
              PromotionCarousel(banners: banners),
              const SizedBox(height: 14),
            ],
          ),
        ],
      ),
    );
  }
}
