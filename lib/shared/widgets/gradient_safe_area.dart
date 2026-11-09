import 'package:material_ui/material_ui.dart';

import '../../core/theme/app_theme.dart';

class GradientSafeArea extends StatelessWidget {
  const GradientSafeArea({
    required this.child,
    this.colors = const [AppTheme.blush, Colors.white],
    this.topSafeArea = true,
    super.key,
  });

  final Widget child;
  final List<Color> colors;
  final bool topSafeArea;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors,
        ),
      ),
      child: SafeArea(top: topSafeArea, child: child),
    );
  }
}
