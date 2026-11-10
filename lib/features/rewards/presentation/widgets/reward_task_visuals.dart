import 'package:material_ui/material_ui.dart';

import '../../domain/models/reward_task.dart';

class DonutTaskVisual extends StatelessWidget {
  const DonutTaskVisual({super.key, required this.task});

  final RewardTask task;

  @override
  Widget build(BuildContext context) {
    final progressQuarters = (task.progress * 4).round().clamp(1, 4);
    return Image.asset(
      'assets/images/rewards_donut_progress_$progressQuarters.png',
      fit: BoxFit.contain,
    );
  }
}

class DrinkTaskVisual extends StatelessWidget {
  const DrinkTaskVisual({super.key, required this.task});

  final RewardTask task;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(96, 96),
          painter: _DrinkProgressPainter(task.progress),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/rewards_task_americano.png',
            width: 62,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

class _DrinkProgressPainter extends CustomPainter {
  const _DrinkProgressPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(5, 5, size.width - 10, size.height - 10);
    const startAngle = 3.141592653589793;
    const halfTurn = 3.141592653589793;
    final trackPaint = Paint()
      ..color = const Color(0xFFE8EBED)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;
    final progressPaint = Paint()
      ..color = const Color(0xFFFF7A1A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, halfTurn, false, trackPaint);
    canvas.drawArc(
      rect,
      startAngle,
      halfTurn * progress.clamp(0, 1),
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _DrinkProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
