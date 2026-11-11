import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../../domain/entities/home_content.dart';

import '../widgets/home_top_section.dart';
import '../widgets/home_loading_skeleton.dart';
import '../widgets/home_offline_banner.dart';
import '../widgets/home_product_section.dart';
import '../widgets/nearby_stores_section.dart';
import '../widgets/seasonal_specials_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => switch (state.status) {
        HomeStatus.loading => Column(
          children: [
            if (state.isOffline) const HomeOfflineBanner(),
            const Expanded(child: HomeLoadingSkeleton()),
          ],
        ),
        HomeStatus.success when state.content != null => _buildContent(
          context,
          state.content!,
          state.isOffline,
        ),
        HomeStatus.success || HomeStatus.failure => Column(
          children: [
            if (state.isOffline) const HomeOfflineBanner(),
            Expanded(child: _buildError(context, state)),
          ],
        ),
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    HomeContent content,
    bool isOffline,
  ) => SafeArea(
    top: false,
    bottom: false,
    child: RefreshIndicator(
      onRefresh: context.read<HomeCubit>().refresh,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (isOffline) const SliverToBoxAdapter(child: HomeOfflineBanner()),
          SliverToBoxAdapter(
            child: HomeTopSection(
              member: content.member,
              banners: content.banners,
            ),
          ),
          for (final section in content.sections)
            SliverToBoxAdapter(child: _buildSection(section)),
          const SliverToBoxAdapter(child: SizedBox(height: 88)),
        ],
      ),
    ),
  );

  Widget _buildError(BuildContext context, HomeState state) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(state.errorMessage ?? 'Unable to load Home.'),
          const SizedBox(height: 12),
          FilledButton(
            onPressed: () => context.read<HomeCubit>().load(),
            child: const Text('Try again'),
          ),
        ],
      ),
    ),
  );

  Widget _buildSection(HomeSection section) => switch (section.type) {
    HomeSectionType.seasonal => SeasonalSpecialsSection(
      section: section,
      products: section.products,
    ),
    HomeSectionType.products => HomeProductSection(
      section: section,
      products: section.products,
    ),
    HomeSectionType.shops => NearbyStoresSection(
      section: section,
      shops: section.shops,
    ),
  };
}
