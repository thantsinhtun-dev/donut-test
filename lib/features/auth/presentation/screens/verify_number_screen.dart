import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../widgets/auth_continue_footer.dart';
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
                    AuthContinueFooter(
                      onPressed: () => context.push(AppRoutes.name),
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
  Widget build(BuildContext context) {
    final pinTheme = PinTheme(
      width: 42,
      height: 44,
      textStyle: context.bodyLarge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: const Color(0xFFEFE3E8)),
      ),
    );
    final focusedPinTheme = pinTheme.copyDecorationWith(
      border: Border.all(color: AppTheme.primary, width: 1.5),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: pinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: pinTheme,
      separatorBuilder: (_) => const SizedBox(width: 6),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.done,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      hapticFeedbackType: HapticFeedbackType.lightImpact,
    );
  }
}
