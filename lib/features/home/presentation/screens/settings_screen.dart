import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.pageState != current.pageState &&
          current.pageState == PageState.success &&
          current.successMessage == AuthPageMessages.loggedOut,
      listener: (context, state) => context.go(AppRoutes.onboarding),
      child: ColoredBox(
        color: const Color(0xFFF1F3F4),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
            children: [
              const Text(
                'Settings',
                style: TextStyle(
                  color: AppTheme.ink,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: const Icon(Icons.logout, color: AppTheme.accent),
                  title: const Text('Log out'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.read<AuthCubit>().logout(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
