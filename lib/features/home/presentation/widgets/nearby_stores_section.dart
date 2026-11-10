import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';

class NearbyStoresSection extends StatelessWidget {
  const NearbyStoresSection({super.key});

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
          const Text(
            'There are 4 J’Donut shops\nnear you. 🥰',
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
              children: const [
                _StoreCard(),
                SizedBox(width: 10),
                _StoreCard(isSecond: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({this.isSecond = false});

  final bool isSecond;

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
              child: Image.asset(
                'assets/images/storefront_promo.png',
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: isSecond ? Alignment.topRight : Alignment.topLeft,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            isSecond ? 'J’Donut Town Center' : 'Myaynigone J’Donut',
            style: const TextStyle(
              color: AppTheme.ink,
              fontSize: 9,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            isSecond
                ? 'Township, Yangon.'
                : '2972 Pyay Road, Sanchaung Township, Yangon.',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Color(0xFF7F858D), fontSize: 8),
          ),
          const Text(
            'Order Online',
            style: TextStyle(
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
