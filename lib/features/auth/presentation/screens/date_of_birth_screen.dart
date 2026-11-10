import 'package:flutter/services.dart';
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

class DateOfBirthScreen extends StatefulWidget {
  const DateOfBirthScreen({super.key});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  late final TextEditingController _monthController;
  late final TextEditingController _dayController;
  late final TextEditingController _yearController;
  final _monthFocusNode = FocusNode();
  final _dayFocusNode = FocusNode();
  final _yearFocusNode = FocusNode();
  final _hasBlurredDateField = ValueNotifier(false);

  DateTime? get _parsedBirthDate =>
      parseValidDateOfBirth(month: _monthController.text, day: _dayController.text, year: _yearController.text);

  String? get _dateErrorText => _hasBlurredDateField.value && _parsedBirthDate == null
      ? 'Enter a valid date. You must be at least 13 years old.'
      : null;

  @override
  void initState() {
    super.initState();
    final auth = context.read<AuthCubit>().state;
    _monthController = TextEditingController(text: auth.birthMonth);
    _dayController = TextEditingController(text: auth.birthDay);
    _yearController = TextEditingController(text: auth.birthYear);
    _monthFocusNode.addListener(_onDateFieldFocusChanged);
    _dayFocusNode.addListener(_onDateFieldFocusChanged);
    _yearFocusNode.addListener(_onDateFieldFocusChanged);
  }

  @override
  void dispose() {
    _monthController.dispose();
    _dayController.dispose();
    _yearController.dispose();
    _hasBlurredDateField.dispose();
    _monthFocusNode
      ..removeListener(_onDateFieldFocusChanged)
      ..dispose();
    _dayFocusNode
      ..removeListener(_onDateFieldFocusChanged)
      ..dispose();
    _yearFocusNode
      ..removeListener(_onDateFieldFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onDateFieldFocusChanged() {
    final anyFieldFocused = _monthFocusNode.hasFocus || _dayFocusNode.hasFocus || _yearFocusNode.hasFocus;
    if (!anyFieldFocused && !_hasBlurredDateField.value) {
      _hasBlurredDateField.value = true;
    }
  }

  void _saveDraft() {
    context.read<AuthCubit>().updateBirthDateParts(
      month: _monthController.text,
      day: _dayController.text,
      year: _yearController.text,
    );
  }

  void _continue() {
    final birthDate = _parsedBirthDate;
    if (birthDate == null) return;
    final monthText = birthDate.month.toString().padLeft(2, '0');
    final dayText = birthDate.day.toString().padLeft(2, '0');
    context.read<AuthCubit>().submitRegistration('${birthDate.year}-$monthText-$dayText');
  }

  @override
  Widget build(BuildContext context) {
    final isSaving = context.watch<AuthCubit>().state.pageState == PageState.loading;
    final isDateValid = _parsedBirthDate != null;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.pageState != current.pageState &&
          current.pageState == PageState.success &&
          current.successMessage == AuthPageMessages.registrationSaved,
      listener: (context, state) => context.go(AppRoutes.welcome),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const OnboardingStepHeader(progress: 1, isComplete: true),
                          const SizedBox(height: 28),
                          Text(
                            "What's your\ndate of birth?",
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontSize: 24,
                              height: 1.16,
                              letterSpacing: -.35,
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            controller: _monthController,
                            focusNode: _monthFocusNode,
                            enabled: !isSaving,
                            hintText: 'Month',
                            textCapitalization: TextCapitalization.words,
                            onChanged: (_) => _saveDraft(),
                          ),
                          const SizedBox(height: 10),
                          AppTextFormField(
                            controller: _dayController,
                            focusNode: _dayFocusNode,
                            enabled: !isSaving,
                            hintText: 'Day',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(2),
                            ],
                            onChanged: (_) => _saveDraft(),
                          ),
                          const SizedBox(height: 10),
                          AppTextFormField(
                            controller: _yearController,
                            focusNode: _yearFocusNode,
                            enabled: !isSaving,
                            hintText: 'Year',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            onChanged: (_) => _saveDraft(),
                          ),
                          ListenableBuilder(
                            listenable: Listenable.merge([
                              _monthController,
                              _dayController,
                              _yearController,
                              _hasBlurredDateField,
                            ]),
                            builder: (context, _) => _dateErrorText == null
                                ? const SizedBox.shrink()
                                : Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      _dateErrorText!,
                                      style: const TextStyle(color: AppTheme.accent, fontSize: 12),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      AuthContinueFooter(isLoading: isSaving, onPressed: isSaving || !isDateValid ? null : _continue),
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
