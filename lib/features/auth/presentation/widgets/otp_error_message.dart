import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_theme.dart';

class OtpErrorMessage extends StatelessWidget {
  const OtpErrorMessage({required this.errorText, super.key});

  final ValueListenable<String?> errorText;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<String?>(
    valueListenable: errorText,
    builder: (context, message, _) => message == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              message,
              style: const TextStyle(color: AppTheme.accent, fontSize: 12),
            ),
          ),
  );
}
