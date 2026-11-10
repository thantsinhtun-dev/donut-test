import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

class OtpResendButton extends StatelessWidget {
  const OtpResendButton({
    required this.secondsRemaining,
    required this.isBusy,
    required this.isResending,
    required this.onResend,
    super.key,
  });

  final ValueListenable<int> secondsRemaining;
  final bool isBusy;
  final bool isResending;
  final VoidCallback onResend;

  @override
  Widget build(BuildContext context) => Align(
    alignment: Alignment.centerLeft,
    child: ValueListenableBuilder<int>(
      valueListenable: secondsRemaining,
      builder: (context, remaining, _) {
        final label = isResending
            ? 'Resending code…'
            : remaining == 0
            ? 'Resend code'
            : 'Resend code in ${_formatDuration(remaining)}';
        return TextButton(
          onPressed: remaining == 0 && !isBusy ? onResend : null,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(vertical: 4),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(label),
        );
      },
    ),
  );

  String _formatDuration(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
