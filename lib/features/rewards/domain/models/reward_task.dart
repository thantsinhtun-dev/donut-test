enum RewardTaskType { donut, drink }

class RewardTask {
  const RewardTask({
    required this.title,
    required this.currentCount,
    required this.targetCount,
    required this.points,
    required this.type,
  });

  final String title;
  final int currentCount;
  final int targetCount;
  final int points;
  final RewardTaskType type;

  double get progress => targetCount == 0 ? 0 : currentCount / targetCount;

  bool get isComplete => currentCount >= targetCount;

  String get progressLabel => '$currentCount/$targetCount';
}
