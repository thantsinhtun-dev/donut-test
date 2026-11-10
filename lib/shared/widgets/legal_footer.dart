import 'package:material_ui/material_ui.dart';

import '../../core/extensions/app_context_extension.dart';
import '../../core/theme/app_theme.dart';
import 'placeholder_action.dart';

class LegalFooter extends StatelessWidget {
  const LegalFooter({super.key});

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      style: context.bodySmall.copyWith(fontSize: 10, height: 1.45),
      children: [
        const TextSpan(
          text: 'By continuing, you acknowledge that you have read and agree to our ',
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            onTap: () => showPlaceholderAction(context, 'Terms of Use'),
            child: Text(
              'Terms of Use',
              style: context.bodySmall.copyWith(
                color: AppTheme.accent,
                fontSize: 10,
                height: 1.45,
              ),
            ),
          ),
        ),
        const TextSpan(text: ' and '),
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            onTap: () => showPlaceholderAction(context, 'Privacy Policy'),
            child: Text(
              'Privacy Policy',
              style: context.bodySmall.copyWith(
                color: AppTheme.accent,
                fontSize: 10,
                height: 1.45,
              ),
            ),
          ),
        ),
        const TextSpan(text: '.'),
      ],
    ),
    textAlign: TextAlign.center,
  );
}
