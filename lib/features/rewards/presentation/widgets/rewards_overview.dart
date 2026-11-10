import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/number_format_utils.dart';

class RewardsOverview extends StatelessWidget {
  const RewardsOverview({super.key, this.points = 680000, this.targetPoints = 900000});

  final int points;
  final int targetPoints;

  @override
  Widget build(BuildContext context) {
    final progress = targetPoints <= 0 ? 0.0 : (points / targetPoints).clamp(0.0, 1.0).toDouble();
    return SizedBox(
      height: 250,
      child: Row(
        children: [
          const Expanded(child: _TierList()),
          SizedBox(
            width: 240,
            height: 240,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 240,
                  height: 240,
                  child: CustomPaint(painter: DonutProgressPainter(progress: progress)),
                ),
                Container(
                  width: 136,
                  height: 136,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Total points', style: TextStyle(color: AppTheme.accent, fontSize: 13)),
                      SizedBox(height: 3),
                      Text(
                        formatPoints(points),
                        style: TextStyle(color: AppTheme.accent, fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DonutProgressPainter extends CustomPainter {
  DonutProgressPainter({required this.progress});

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 52.0;
    final rect = Offset.zero & size;
    final center = rect.center;
    final outerRadius = size.shortestSide / 2;
    final innerRadius = outerRadius - strokeWidth;
    final radius = (outerRadius + innerRadius) / 2;
    final arcRect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = const Color(0xFFF0F1F2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    final progressPaint = Paint()
      ..shader = const SweepGradient(
        colors: [Color(0xFFFF79B2), Color(0xFFFF4B98), Color(0xFFFF4E9A), Color(0xFFFF79B2)],
        stops: [0, .32, .68, 1],
      ).createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    canvas.drawArc(arcRect, -math.pi / 2, sweep, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant DonutProgressPainter oldDelegate) => oldDelegate.progress != progress;
}

class _TierList extends StatelessWidget {
  const _TierList();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 42,
          height: 225,
          child: FixedTimeline(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 75,
                child: TimelineNode(
                  direction: Axis.vertical,
                  indicator: ContainerIndicator(size: 40, child: Image.asset('assets/images/rewards_tier_silver.png')),
                  endConnector: SolidLineConnector(
                    direction: Axis.vertical,
                    thickness: 2,
                    space: 2,
                    color: Color(0xFF737980),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                child: TimelineNode(
                  direction: Axis.vertical,
                  indicator: ContainerIndicator(size: 40, child: Image.asset('assets/images/rewards_tier_gold.png')),
                  startConnector: SolidLineConnector(
                    direction: Axis.vertical,
                    thickness: 2,
                    space: 2,
                    color: Color(0xFF737980),
                  ),
                  endConnector: SolidLineConnector(
                    direction: Axis.vertical,
                    thickness: 2,
                    space: 2,
                    color: Color(0xFFE7EBED),
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                child: TimelineNode(
                  direction: Axis.vertical,
                  indicator: ContainerIndicator(
                    size: 40,
                    child: Image.asset('assets/images/rewards_tier_platinum.png'),
                  ),
                  startConnector: SolidLineConnector(
                    direction: Axis.vertical,
                    thickness: 2,
                    space: 2,
                    color: Color(0xFFE7EBED),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: const Column(
            children: [
              SizedBox(
                height: 75,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _TierLabel(title: 'Silver', subtitle: 'You’re here now'),
                ),
              ),
              SizedBox(
                height: 75,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _TierLabel(title: 'Gold', subtitle: '500 pts Remaining\nto become Gold'),
                ),
              ),
              SizedBox(
                height: 75,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _TierLabel(title: 'Platinum', subtitle: 'You’ll be here soon'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TierLabel extends StatelessWidget {
  const _TierLabel({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(color: AppTheme.ink, fontSize: 10, fontWeight: FontWeight.w700),
        ),
        Text(subtitle, style: const TextStyle(color: Color(0xFF727980), fontSize: 8, height: 1.25)),
      ],
    );
  }
}
