import 'package:flutter/material.dart';

import '../../core/extensions/app_context_extension.dart';
import '../../core/theme/app_theme.dart';

class LegalFooter extends StatelessWidget {
  const LegalFooter({super.key});

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      style: context.bodySmall.copyWith(fontSize: 10, height: 1.45),
      children: const [
        TextSpan(
          text: 'By continuing, you acknowledge that you have read and agree to our ',
        ),
        TextSpan(
          text: 'Terms of Use',
          style: TextStyle(color: AppTheme.accent),
        ),
        TextSpan(text: ' and '),
        TextSpan(
          text: 'Privacy Policy',
          style: TextStyle(color: AppTheme.accent),
        ),
        TextSpan(text: '.'),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
