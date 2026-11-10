import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';

class OnboardingStepHeader extends StatelessWidget {
  const OnboardingStepHeader({required this.progress, this.isComplete = false, super.key});

  final double progress;
  final bool isComplete;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoutes.onboarding);
            }
          },
          child: const SizedBox(width: 40, height: 40, child: Icon(Icons.arrow_back, size: 20, color: AppTheme.ink)),
        ),
      ),
      isComplete
          ? Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(color: AppTheme.accent, shape: BoxShape.circle),
              child: const Icon(Icons.check, size: 18, color: Colors.white),
            )
          : SizedBox(width: 30, height: 30, child: CustomPaint(painter: _ProgressPainter(progress))),
    ],
  );
}

class _ProgressPainter extends CustomPainter {
  const _ProgressPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = size.shortestSide / 2 - 3;
    final track = Paint()
      ..color = const Color(0xFFB2D6FF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    final progressPaint = Paint()
      ..color = AppTheme.accent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, track);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -mathPi / 2,
      2 * mathPi * progress,
      false,
      progressPaint,
    );
  }

  static const mathPi = 3.1415926535897932;

  @override
  bool shouldRepaint(covariant _ProgressPainter oldDelegate) => progress != oldDelegate.progress;
}
