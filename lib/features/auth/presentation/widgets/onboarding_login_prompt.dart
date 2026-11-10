import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_theme.dart';
import '../cubit/auth_state.dart';

class OnboardingLoginPrompt extends StatelessWidget {
  const OnboardingLoginPrompt({super.key});

  @override
  Widget build(BuildContext context) => Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    children: [
      Text('Already have an account?', style: context.bodySmall),
      TextButton(
        onPressed: () =>
            context.push(AppRoutes.phoneNumber, extra: AuthMode.login),
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: const EdgeInsets.only(left: m1),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          'Log In',
          style: context.bodySmall.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}
