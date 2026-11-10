import 'package:material_ui/material_ui.dart';

import '../widgets/home_top_section.dart';
import '../widgets/home_product_section.dart';
import '../widgets/nearby_stores_section.dart';
import '../widgets/seasonal_specials_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeTopSection()),
          const SliverToBoxAdapter(child: SeasonalSpecialsSection()),
          const SliverToBoxAdapter(child: HomeProductSection(popular: true)),
          const SliverToBoxAdapter(child: HomeProductSection(popular: false)),
          const SliverToBoxAdapter(child: NearbyStoresSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 88)),
        ],
      ),
    );
  }
}
