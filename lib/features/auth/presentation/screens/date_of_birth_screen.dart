import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../widgets/onboarding_step_header.dart';
import '../../../../shared/widgets/app_text_form_field.dart';
import '../widgets/auth_continue_footer.dart';

class DateOfBirthScreen extends StatelessWidget {
  const DateOfBirthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientSafeArea(
        colors: const [AppTheme.blush, Colors.white],
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const OnboardingStepHeader(
                          progress: 1,
                          isComplete: true,
                        ),
                        const SizedBox(height: 28),
                        Text(
                          "What's your\ndate of birth?",
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontSize: 24,
                            height: 1.16,
                            letterSpacing: -.35,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AppTextFormField(initialValue: 'May'),
                        const SizedBox(height: 10),
                        const AppTextFormField(initialValue: '1'),
                        const SizedBox(height: 10),
                        const AppTextFormField(initialValue: '1980'),
                      ],
                    ),
                    AuthContinueFooter(
                      onPressed: () => context.go(AppRoutes.welcome),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
