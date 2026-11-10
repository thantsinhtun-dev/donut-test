import 'package:material_ui/material_ui.dart';

import '../../core/extensions/app_context_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.height = 52,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    height: height,
    child: AbsorbPointer(
      absorbing: onPressed == null,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: onPressed == null
              ? context.colorScheme.surfaceContainerHighest
              : context.colorScheme.primary,
          foregroundColor: onPressed == null ? context.colorScheme.onSurfaceVariant : context.colorScheme.onPrimary,
        ),
        child: isLoading
            ? SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(strokeWidth: 2, color: context.colorScheme.onPrimary),
              )
            : Text(label),
      ),
    ),
  );
}
