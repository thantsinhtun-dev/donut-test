import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';

class OtpUnregisteredPrompt extends StatelessWidget {
  const OtpUnregisteredPrompt({
    required this.visible,
    required this.onRegister,
    super.key,
  });

  final ValueListenable<bool> visible;
  final VoidCallback onRegister;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
    valueListenable: visible,
    builder: (context, isVisible, _) => isVisible
        ? Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text(
                  'This number is not registered.',
                  style: TextStyle(color: AppTheme.accent, fontSize: 12),
                ),
                TextButton(
                  onPressed: onRegister,
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Register now'),
                ),
              ],
            ),
          )
        : const SizedBox.shrink(),
  );
}
