import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticating = context.watch<AuthCubit>().state.pageState == PageState.loading;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.pageState != current.pageState &&
          current.pageState == PageState.success &&
          current.successMessage == AuthPageMessages.loggedIn,
      listener: (context, state) => context.go(AppRoutes.home),
      child: Scaffold(
        backgroundColor: AppTheme.blush,
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned.fill(child: _WelcomeFoodCollage()),
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: const Alignment(0, .05),
                        end: Alignment.bottomCenter,
                        colors: [
                          AppTheme.blush.withValues(alpha: 0),
                          AppTheme.blush.withValues(alpha: .78),
                          AppTheme.blush,
                        ],
                        stops: const [0, .43, .7],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to the\nworld of J’Donuts',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppTheme.ink, fontSize: 22, height: 1.15, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 28),
                    PrimaryButton(
                      label: "LET'S EXPLORE",
                      isLoading: isAuthenticating,
                      onPressed: isAuthenticating ? null : () => context.read<AuthCubit>().login(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeFoodCollage extends StatelessWidget {
  const _WelcomeFoodCollage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 130),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: const [
                Expanded(
                  child: _FoodTile(alignment: Alignment.topLeft, color: Color(0xFFB7E9F3)),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: _FoodTile(alignment: Alignment.center, color: Color(0xFFFFDCE8)),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: const [
                Expanded(
                  child: _FoodTile(alignment: Alignment.topRight, color: Color(0xFFE8EFF5)),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: _FoodTile(alignment: Alignment.bottomRight, color: Color(0xFFFFC84D)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodTile extends StatelessWidget {
  const _FoodTile({required this.alignment, required this.color});

  final Alignment alignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        color: color,
        child: Image.asset('assets/images/onboarding_hero.png', fit: BoxFit.cover, alignment: alignment),
      ),
    );
  }
}
