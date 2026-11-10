import 'package:material_ui/material_ui.dart';

import '../../../../shared/widgets/legal_footer.dart';
import '../../../../shared/widgets/primary_button.dart';

class AuthContinueFooter extends StatelessWidget {
  const AuthContinueFooter({
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      PrimaryButton(
        label: 'CONTINUE',
        onPressed: onPressed,
        isLoading: isLoading,
      ),
      const SizedBox(height: 14),
      const LegalFooter(),
    ],
  );
}
