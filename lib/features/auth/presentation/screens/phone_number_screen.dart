import 'dart:async';

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

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({this.mode = AuthMode.register, super.key});

  final AuthMode mode;

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _phoneController = TextEditingController();
  final _phoneFocusNode = FocusNode();

  bool get _isPhoneValid => isValidMyanmarPhoneNumber(_phoneController.text);

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(_onPhoneFocusChanged);
    final phone = context.read<AuthCubit>().state.phoneNumber;
    if (phone.startsWith('+95')) {
      _phoneController.text = phone.substring(3);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode
      ..removeListener(_onPhoneFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onPhoneFocusChanged() {
    final shouldShowError = !_phoneFocusNode.hasFocus && !_isPhoneValid;
    context.read<AuthCubit>().setPhoneErrorVisible(shouldShowError);
  }

  void _continue() {
    final phone = '+95${normalizeMyanmarPhoneNumber(_phoneController.text)}';
    unawaited(
      context.read<AuthCubit>().requestOtp(
        phoneNumber: phone,
        mode: widget.mode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final isSendingOtp = authState.pageState == PageState.loading;
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.pageState != current.pageState &&
          current.pageState == PageState.success &&
          current.successMessage == AuthPageMessages.codeSent,
      listener: (context, state) {
        if (ModalRoute.of(context)?.isCurrent ?? false) {
          context.push(AppRoutes.verifyNumber);
        }
      },
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
                          const OnboardingStepHeader(progress: .25),
                          const SizedBox(height: 28),
                          Text(
                            'Enter your phone\nnumber',
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontSize: 24,
                              height: 1.16,
                              letterSpacing: -.35,
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            controller: _phoneController,
                            focusNode: _phoneFocusNode,
                            enabled: !isSendingOtp,
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            prefixText: '+95   ',
                            onChanged: (_) => context
                                .read<AuthCubit>()
                                .setPhoneErrorVisible(false),
                          ),
                          if (authState.showPhoneError) ...[
                            const SizedBox(height: 8),
                            const Text(
                              'Enter a valid phone number.',
                              style: TextStyle(
                                color: AppTheme.accent,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ],
                      ),
                      ListenableBuilder(
                        listenable: _phoneController,
                        builder: (context, _) => AuthContinueFooter(
                          isLoading: isSendingOtp,
                          onPressed: _isPhoneValid && !isSendingOtp
                              ? _continue
                              : null,
                        ),
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
