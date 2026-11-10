import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/models/reward_task.dart';
import 'reward_task_visuals.dart';

class RewardTaskCard extends StatelessWidget {
  const RewardTaskCard({super.key, required this.task});

  final RewardTask task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 124,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(width: 104, height: 104, child: _taskVisual()),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    color: AppTheme.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  task.progressLabel,
                  style: const TextStyle(
                    color: Color(0xFF727980),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: task.isComplete
                            ? AppTheme.primary
                            : const Color(0xFFE5E7E8),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text(
                        'EARN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(width: 9),
                    Text(
                      '${task.points} pts',
                      style: const TextStyle(
                        color: Color(0xFF727980),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskVisual() => switch (task.type) {
    RewardTaskType.donut => DonutTaskVisual(task: task),
    RewardTaskType.drink => DrinkTaskVisual(task: task),
  };
}
