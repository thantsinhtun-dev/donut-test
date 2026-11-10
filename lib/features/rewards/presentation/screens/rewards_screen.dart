import 'package:material_ui/material_ui.dart';

import '../widgets/reward_tasks_section.dart';
import '../widgets/rewards_header.dart';
import '../widgets/rewards_overview.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 14, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    RewardsHeader(),
                    SizedBox(height: 22),
                    RewardsOverview(),
                    RewardFilters(),
                  ],
                ),
              ),
            ),
            const RewardTasksSection(),
          ],
        ),
      ),
    );
  }
}
