import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeLoadingSkeleton extends StatelessWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Skeletonizer.zone(
        enabled: true,
        effect: const ShimmerEffect(
          baseColor: Color(0xFFE4E6E8),
          highlightColor: Color(0xFFF5F6F7),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _topSkeleton(context)),
            const SliverToBoxAdapter(child: _SectionSkeleton()),
            const SliverToBoxAdapter(child: _SectionSkeleton()),
            const SliverToBoxAdapter(child: _SectionSkeleton()),
            const SliverToBoxAdapter(child: SizedBox(height: 88)),
          ],
        ),
      ),
    );
  }

  Widget _topSkeleton(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(
      20,
      MediaQuery.paddingOf(context).top + 14,
      20,
      18,
    ),
    decoration: const BoxDecoration(
      color: Color(0xFFFFEBDD),
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
    ),
    child: Column(
      children: [
        Row(
          children: [
            const _SkeletonBlock(width: 50, height: 50, radius: 25),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SkeletonBlock(width: 125, height: 22, radius: 8),
                  SizedBox(height: 7),
                  _SkeletonBlock(width: 95, height: 12, radius: 6),
                ],
              ),
            ),
            _SkeletonBlock(width: 72, height: 40, radius: 20),
          ],
        ),
        const SizedBox(height: 16),
        const Align(
          alignment: Alignment.centerLeft,
          child: _SkeletonBlock(width: 245, height: 34, radius: 20),
        ),
        const SizedBox(height: 20),
        const _SkeletonBlock(width: double.infinity, height: 180, radius: 18),
      ],
    ),
  );

  static Widget _sectionHeader() => const Padding(
    padding: EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        _SkeletonBlock(width: 170, height: 20, radius: 7),
        Spacer(),
        _SkeletonBlock(width: 34, height: 34, radius: 17),
      ],
    ),
  );
}

class _SectionSkeleton extends StatelessWidget {
  const _SectionSkeleton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeLoadingSkeleton._sectionHeader(),
          SizedBox(
            height: 158,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => const SizedBox(
                width: 154,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _SkeletonBlock(
                        width: double.infinity,
                        height: double.infinity,
                        radius: 13,
                      ),
                    ),
                    SizedBox(height: 7),
                    _SkeletonBlock(width: 130, height: 12, radius: 6),
                    SizedBox(height: 5),
                    _SkeletonBlock(width: 72, height: 9, radius: 5),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonBlock extends StatelessWidget {
  const _SkeletonBlock({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) => Bone(
    width: width.isFinite ? width : null,
    height: height.isFinite ? height : null,
    shape: width == height && radius >= width / 2
        ? BoxShape.circle
        : BoxShape.rectangle,
    borderRadius: width == height && radius >= width / 2
        ? null
        : BorderRadius.circular(radius),
  );
}
