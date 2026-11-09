import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../../../../shared/widgets/legal_footer.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../widgets/social_login_buttons.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientSafeArea(
        colors: const [Color(0xFFFFE7EF), Color(0xFFFFFCFD)],
        topSafeArea: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Round food for\nevery mood',
                      textAlign: TextAlign.center,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontSize: 26,
                        height: 1.12,
                        letterSpacing: -.45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(label: "LET'S GET STARTED", onPressed: () => context.push(AppRoutes.phoneNumber)),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Column(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text('Already have an account?', style: context.bodySmall),
                      const IgnorePointer(
                        child: TextButton(
                          onPressed: _noop,
                          style: ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size.zero),
                            padding: WidgetStatePropertyAll(EdgeInsets.only(left: 4)),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text('Log In'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const SocialLoginButtons(),
                  const SizedBox(height: 14),
                  const LegalFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _noop() {}
