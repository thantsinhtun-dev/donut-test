import 'package:flutter/material.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/legal_footer.dart';
import '../widgets/onboarding_step_header.dart';

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
                        const _DateField(value: 'May'),
                        const SizedBox(height: 10),
                        const _DateField(value: '1'),
                        const SizedBox(height: 10),
                        const _DateField(value: '1980'),
                      ],
                    ),
                    PrimaryButton(label: 'CONTINUE', onPressed: () {}),
                    const LegalFooter(),
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

class _DateField extends StatelessWidget {
  const _DateField({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) => TextFormField(
    initialValue: value,
    style: context.bodyMedium.copyWith(color: AppTheme.ink),
    decoration: const InputDecoration(),
  );
}
