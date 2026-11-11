import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/cubit/home_state.dart';
import '../../../home/presentation/widgets/home_loading_skeleton.dart';
import '../../../home/presentation/widgets/home_offline_banner.dart';
import '../widgets/reward_tasks_section.dart';
import '../widgets/rewards_header.dart';
import '../widgets/rewards_overview.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final member = state.content?.member;
        if (member == null) return const HomeLoadingSkeleton();
        return ColoredBox(
          color: Colors.white,
          child: SafeArea(
            bottom: false,
            child: RefreshIndicator(
              onRefresh: context.read<HomeCubit>().refresh,
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  if (state.isOffline)
                    const SliverToBoxAdapter(child: HomeOfflineBanner()),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 14, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const RewardsHeader(),
                          const SizedBox(height: 22),
                          RewardsOverview(member: member, animate: isActive),
                          const RewardFilters(),
                        ],
                      ),
                    ),
                  ),
                  const RewardTasksSection(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
