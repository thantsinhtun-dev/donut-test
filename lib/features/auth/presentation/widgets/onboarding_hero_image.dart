import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/app_context_extension.dart';

class OnboardingHeroImage extends StatelessWidget {
  const OnboardingHeroImage({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: (context.dimension.height * .52).clamp(300, 460),
    width: double.infinity,
    child: ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Colors.black, Colors.transparent],
        stops: [0, .72, 1],
      ).createShader(bounds),
      child: Image.asset(
        'assets/images/onboarding_hero.png',
        fit: BoxFit.cover,
        semanticLabel: 'Pink frosted donut with colorful sprinkles',
      ),
    ),
  );
}
