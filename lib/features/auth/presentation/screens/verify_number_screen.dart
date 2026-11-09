import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/legal_footer.dart';
import '../widgets/onboarding_step_header.dart';

class VerifyNumberScreen extends StatelessWidget {
  const VerifyNumberScreen({super.key});

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
                        const OnboardingStepHeader(progress: .66),
                        const SizedBox(height: 28),
                        Text(
                          'Verify your number',
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontSize: 24,
                            height: 1.16,
                            letterSpacing: -.35,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "We've sent 6 digit OTP to +959254135592",
                          style: context.bodySmall.copyWith(fontSize: 11),
                        ),
                        const SizedBox(height: 22),
                        const _OtpBoxes(),
                        const SizedBox(height: 16),
                        Text.rich(
                          TextSpan(
                            style: context.bodySmall.copyWith(
                              fontSize: 11,
                              height: 1.5,
                            ),
                            children: const [
                              TextSpan(
                                text: "Didn't receive the code?\nresend in ",
                              ),
                              TextSpan(
                                text: '4:58',
                                style: TextStyle(color: AppTheme.accent),
                              ),
                              TextSpan(text: ' min'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        PrimaryButton(
                          label: 'CONTINUE',
                          onPressed: () => context.push(AppRoutes.name),
                        ),
                        const SizedBox(height: 14),
                        const LegalFooter(),
                      ],
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

class _OtpBoxes extends StatelessWidget {
  const _OtpBoxes();

  @override
  Widget build(BuildContext context) => Row(
    children: List.generate(
      6,
      (index) => Expanded(
        child: Container(
          height: 44,
          margin: EdgeInsets.only(right: index == 5 ? 0 : 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    ),
  );
}
