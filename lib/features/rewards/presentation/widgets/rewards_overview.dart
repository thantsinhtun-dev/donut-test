import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/number_format_utils.dart';
import '../../../home/domain/entities/home_content.dart';

class RewardsOverview extends StatelessWidget {
  const RewardsOverview({super.key, required this.member, this.animate = true});

  final MemberProfile member;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final progress = member.progressTargetPoints <= 0
        ? 0.0
        : (member.totalPoints / member.progressTargetPoints)
              .clamp(0.0, 1.0)
              .toDouble();
    return SizedBox(
      height: 250,
      child: Row(
        children: [
          Expanded(child: _TierList(member: member)),
          SizedBox(
            width: 240,
            height: 240,
            child: TweenAnimationBuilder<double>(
              key: ValueKey(animate),
              tween: Tween(begin: animate ? 0 : 1, end: 1),
              duration: animate
                  ? const Duration(milliseconds: 1600)
                  : Duration.zero,
              curve: Curves.easeOutCubic,
              builder: (context, animatedProgress, _) {
                final animatedPoints = (member.totalPoints * animatedProgress)
                    .round();
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 240,
                      height: 240,
                      child: CustomPaint(
                        painter: DonutProgressPainter(
                          progress: progress * animatedProgress,
                        ),
                      ),
                    ),
                    Container(
                      width: 136,
                      height: 136,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total points',
                            style: TextStyle(
                              color: AppTheme.accent,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            formatPoints(animatedPoints),
                            style: const TextStyle(
                              color: AppTheme.accent,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
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
        colors: [
          Color(0xFFFF79B2),
          Color(0xFFFF4B98),
          Color(0xFFFF4E9A),
          Color(0xFFFF79B2),
        ],
        stops: [0, .32, .68, 1],
      ).createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final sweep = 2 * math.pi * progress.clamp(0.0, 1.0);
    canvas.drawArc(arcRect, -math.pi / 2, sweep, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant DonutProgressPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

class _TierList extends StatelessWidget {
  const _TierList({required this.member});

  final MemberProfile member;

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
                  indicator: ContainerIndicator(
                    size: 40,
                    child: Image.asset(_tierAsset(member.tier)),
                  ),
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
                  indicator: ContainerIndicator(
                    size: 40,
                    child: Image.asset(_tierAsset(member.nextTierName)),
                  ),
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
                    child: Image.asset(_tierAsset(member.followingTierName)),
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
          child: Column(
            children: [
              SizedBox(
                height: 75,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _TierLabel(
                    title: member.tier,
                    subtitle: 'You’re here now',
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _TierLabel(
                    title: member.nextTierName,
                    subtitle:
                        '${formatPoints(member.pointsToNextTier)} pts Remaining\nto become ${member.nextTierName}',
                  ),
                ),
              ),
              SizedBox(
                height: 75,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _TierLabel(
                    title: member.followingTierName,
                    subtitle: 'You’ll be here soon',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String _tierAsset(String tier) => switch (tier.toLowerCase()) {
  'bronze' => 'assets/images/rewards_tier_bronze.png',
  'silver' => 'assets/images/rewards_tier_silver.png',
  'gold' => 'assets/images/rewards_tier_gold.png',
  'platinum' => 'assets/images/rewards_tier_platinum.png',
  _ => 'assets/images/member_badge.png',
};

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
          style: const TextStyle(
            color: AppTheme.ink,
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            color: Color(0xFF727980),
            fontSize: 8,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}
