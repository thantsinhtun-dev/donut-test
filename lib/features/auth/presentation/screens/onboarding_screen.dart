import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../../../../shared/widgets/legal_footer.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../widgets/onboarding_hero_image.dart';
import '../widgets/onboarding_login_prompt.dart';
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
            const OnboardingHeroImage(),
            Padding(
              padding: .fromLTRB(m6, m1, m6, 0),
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
                  const SizedBox(height: m5),
                  PrimaryButton(
                    label: "LET'S GET STARTED",
                    onPressed: () => context.push(AppRoutes.phoneNumber),
                  ),
                  const SizedBox(height: m3),
                  const OnboardingLoginPrompt(),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(m6, 0, m6, m4),
              child: Column(
                children: [
                  const SocialLoginButtons(),
                  const SizedBox(height: m3),
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
