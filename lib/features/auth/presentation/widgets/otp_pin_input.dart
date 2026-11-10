import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/theme/app_theme.dart';

class OtpPinInput extends StatelessWidget {
  const OtpPinInput({
    required this.controller,
    required this.uiRevision,
    required this.shakeAnimation,
    required this.enabled,
    required this.defaultPinTheme,
    required this.focusedPinTheme,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final Listenable uiRevision;
  final Animation<double> shakeAnimation;
  final bool enabled;
  final PinTheme defaultPinTheme;
  final PinTheme focusedPinTheme;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: uiRevision,
    builder: (context, _) => AnimatedBuilder(
      animation: shakeAnimation,
      builder: (context, child) => Transform.translate(
        offset: Offset(shakeAnimation.value, 0),
        child: child,
      ),
      child: Pinput(
        controller: controller,
        length: 6,
        enabled: enabled,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: defaultPinTheme,
        separatorBuilder: (_) => const SizedBox(width: 6),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        keyboardType: TextInputType.number,
        autofillHints: const [AutofillHints.oneTimeCode],
        textInputAction: TextInputAction.done,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: onChanged,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        hapticFeedbackType: HapticFeedbackType.lightImpact,
      ),
    ),
  );

  static PinTheme createDefaultTheme(TextStyle textStyle) => PinTheme(
    width: 42,
    height: 44,
    textStyle: textStyle,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(7),
      border: Border.all(color: const Color(0xFFEFE3E8)),
    ),
  );

  static PinTheme createFocusedTheme(PinTheme theme) =>
      theme.copyDecorationWith(
        border: Border.all(color: AppTheme.primary, width: 1.5),
      );
}
