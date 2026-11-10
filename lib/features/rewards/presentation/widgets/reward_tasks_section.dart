import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/reward_task.dart';
import 'reward_task_card.dart';

const _rewardTasks = <RewardTask>[
  RewardTask(
    title: 'Eat 4 Coco donuts',
    currentCount: 4,
    targetCount: 4,
    points: 100,
    type: RewardTaskType.donut,
  ),
  RewardTask(
    title: 'Eat 4 Coco donuts',
    currentCount: 1,
    targetCount: 4,
    points: 200,
    type: RewardTaskType.donut,
  ),
  RewardTask(
    title: 'Drink 12 cups\namericano',
    currentCount: 9,
    targetCount: 12,
    points: 100,
    type: RewardTaskType.drink,
  ),
];

class RewardTasksSection extends StatelessWidget {
  const RewardTasksSection({super.key});

  @override
  Widget build(BuildContext context) {
    const sectionBackground = Color(0xFFF1F3F4);
    return SliverList(
      delegate: SliverChildListDelegate([
        const ColoredBox(color: sectionBackground, child: SizedBox(height: 4)),
        for (final task in _rewardTasks)
          ColoredBox(
            color: sectionBackground,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: RewardTaskCard(task: task),
            ),
          ),
        const ColoredBox(color: sectionBackground, child: SizedBox(height: 24)),
      ]),
    );
  }
}

class RewardFilters extends StatelessWidget {
  const RewardFilters({super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.primary,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Text(
            'Eat more earn more',
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFE6E9EB),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: const Text(
            'Gift',
            style: TextStyle(color: Color(0xFF787E85), fontSize: 13),
          ),
        ),
      ],
    ),
  );
}
