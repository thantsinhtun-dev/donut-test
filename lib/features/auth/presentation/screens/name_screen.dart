import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_text_form_field.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../../domain/validators/auth_validators.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_continue_footer.dart';
import '../widgets/onboarding_step_header.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  final _submitted = ValueNotifier(false);

  String? get _firstNameError =>
      !_submitted.value || isValidFirstName(_firstNameController.text)
      ? null
      : 'Enter a name with 1 to 50 letters and spaces.';

  String? get _lastNameError =>
      !_submitted.value || isValidLastName(_lastNameController.text)
      ? null
      : 'Use up to 50 letters and spaces.';

  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthCubit>().state;
    _firstNameController = TextEditingController(text: auth.firstName);
    _lastNameController = TextEditingController(text: auth.lastName);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _submitted.dispose();
    super.dispose();
  }

  void _continue() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    _submitted.value = true;
    if (!isValidFirstName(firstName) || !isValidLastName(lastName)) {
      return;
    }
    final cubit = context.read<AuthCubit>();
    cubit.updateName(firstName: firstName, lastName: lastName);
    unawaited(cubit.submitName());
  }

  @override
  Widget build(BuildContext context) {
    final isSaving =
        context.watch<AuthCubit>().state.pageState == PageState.loading;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.pageState != current.pageState &&
          current.pageState == PageState.success &&
          current.successMessage == AuthPageMessages.nameVerified,
      listener: (context, state) => context.push(AppRoutes.dateOfBirth),
      child: Scaffold(
        body: GradientSafeArea(
          colors: const [AppTheme.blush, Colors.white],
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ListenableBuilder(
                        listenable: Listenable.merge([
                          _firstNameController,
                          _lastNameController,
                          _submitted,
                        ]),
                        builder: (context, _) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const OnboardingStepHeader(progress: .72),
                            const SizedBox(height: 28),
                            Text(
                              "What's your\nname?",
                              style: context.textTheme.headlineMedium?.copyWith(
                                fontSize: 24,
                                height: 1.16,
                                letterSpacing: -.35,
                              ),
                            ),
                            const SizedBox(height: 20),
                            AppTextFormField(
                              controller: _firstNameController,
                              enabled: !isSaving,
                              textCapitalization: TextCapitalization.words,
                              hintText: 'First Name',
                              onChanged: (_) {
                                context.read<AuthCubit>().updateName(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                );
                              },
                            ),
                            if (_firstNameError case final error?) ...[
                              const SizedBox(height: 6),
                              _NameError(error),
                            ],
                            const SizedBox(height: 10),
                            AppTextFormField(
                              controller: _lastNameController,
                              enabled: !isSaving,
                              textCapitalization: TextCapitalization.words,
                              hintText: 'Last Name',
                              onChanged: (_) {
                                context.read<AuthCubit>().updateName(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                );
                              },
                            ),
                            if (_lastNameError case final error?) ...[
                              const SizedBox(height: 6),
                              _NameError(error),
                            ],
                          ],
                        ),
                      ),
                      AuthContinueFooter(
                        isLoading: isSaving,
                        onPressed: isSaving ? null : _continue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NameError extends StatelessWidget {
  const _NameError(this.message);

  final String message;

  @override
  Widget build(BuildContext context) => Text(
    message,
    style: const TextStyle(color: AppTheme.accent, fontSize: 12),
  );
}
