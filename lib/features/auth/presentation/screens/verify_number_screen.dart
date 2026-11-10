import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/app_context_extension.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/gradient_safe_area.dart';
import '../../domain/validators/auth_validators.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import '../widgets/auth_continue_footer.dart';
import '../widgets/onboarding_step_header.dart';
import '../widgets/otp_error_message.dart';
import '../widgets/otp_pin_input.dart';
import '../widgets/otp_resend_button.dart';
import '../widgets/otp_unregistered_prompt.dart';

class VerifyNumberScreen extends StatefulWidget {
  const VerifyNumberScreen({super.key});

  @override
  State<VerifyNumberScreen> createState() => _VerifyNumberScreenState();
}

class _VerifyNumberScreenState extends State<VerifyNumberScreen> with SingleTickerProviderStateMixin {
  final _pinController = TextEditingController();
  final ValueNotifier<int> _uiRevision = ValueNotifier(0);
  final ValueNotifier<int> _resendSecondsRemaining = ValueNotifier(otpResendCooldown.inSeconds);
  final ValueNotifier<String?> _errorText = ValueNotifier(null);
  final ValueNotifier<bool> _numberNotRegistered = ValueNotifier(false);
  late final AnimationController _shakeController;
  late final Animation<double> _shakeAnimation;
  Timer? _resendTimer;
  bool _isShaking = false;
  int _wrongAttempts = 0;

  bool get _isLocked => _wrongAttempts >= 3;

  void _refreshUi() => _uiRevision.value++;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 420));
    _shakeAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: -10), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10, end: 10), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10, end: -7), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -7, end: 5), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 5, end: 0), weight: 1),
    ]).animate(_shakeController);
    _startResendTimer();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _resendTimer?.cancel();
    _shakeController.dispose();
    _uiRevision.dispose();
    _resendSecondsRemaining.dispose();
    _errorText.dispose();
    _numberNotRegistered.dispose();
    super.dispose();
  }

  Future<void> _continue() async {
    await context.read<AuthCubit>().verifyOtp(_pinController.text);
  }

  Future<void> _handleInvalidOtp() async {
    if (!mounted) return;
    _isShaking = true;
    _wrongAttempts++;
    _numberNotRegistered.value = false;
    _errorText.value = null;
    _refreshUi();
    await _shakeController.forward(from: 0);
    if (mounted) {
      _pinController.clear();
      _isShaking = false;
      _errorText.value = _isLocked
          ? 'Too many incorrect codes. Resend the code to try again.'
          : 'Incorrect code. Please try again.';
      _refreshUi();
    }
  }

  void _resendCode() {
    if (_resendSecondsRemaining.value > 0) return;
    _wrongAttempts = 0;
    _errorText.value = null;
    _numberNotRegistered.value = false;
    _pinController.clear();
    _resendSecondsRemaining.value = otpResendCooldown.inSeconds;
    _refreshUi();
    _startResendTimer();
    FocusManager.instance.primaryFocus?.unfocus();
    unawaited(context.read<AuthCubit>().resendOtp());
  }

  void _startResendTimer() {
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_resendSecondsRemaining.value <= 1) {
        timer.cancel();
        _resendSecondsRemaining.value = 0;
      } else {
        _resendSecondsRemaining.value--;
      }
    });
  }

  void _startRegistration() {
    context.read<AuthCubit>().selectRegistration();
    context.push(AppRoutes.name);
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthCubit>().state;
    final isBusy = auth.pageState == PageState.loading;
    final pinTheme = OtpPinInput.createDefaultTheme(context.bodyLarge);
    final focusedPinTheme = OtpPinInput.createFocusedTheme(pinTheme);

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.pageState != current.pageState,
      listener: (context, state) {
        if (state.pageState == PageState.fail && state.errorMessage == AuthPageMessages.invalidOtp) {
          unawaited(_handleInvalidOtp());
        } else if (state.pageState == PageState.success && state.successMessage == AuthPageMessages.numberVerified) {
          _resendTimer?.cancel();
          context.push(AppRoutes.name);
        } else if (state.pageState == PageState.fail && state.errorMessage == AuthPageMessages.unregisteredPhone) {
          _errorText.value = null;
          _numberNotRegistered.value = true;
          _refreshUi();
        } else if (state.pageState == PageState.success && state.successMessage == AuthPageMessages.loggedIn) {
          _resendTimer?.cancel();
          context.go(AppRoutes.home);
        } else if (state.pageState == PageState.fail) {
          _errorText.value = state.errorMessage;
          _refreshUi();
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
                          const OnboardingStepHeader(progress: .50),
                          const SizedBox(height: 28),
                          Text(
                            'Verify your number',
                            style: context.textTheme.headlineMedium?.copyWith(
                              fontSize: 24,
                              height: 1.16,
                              letterSpacing: -.35,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "We've sent a 6-digit OTP to ${auth.phoneNumber}",
                            style: context.bodySmall.copyWith(fontSize: 11),
                          ),
                          const SizedBox(height: 22),
                          OtpPinInput(
                            controller: _pinController,
                            uiRevision: _uiRevision,
                            shakeAnimation: _shakeAnimation,
                            enabled: !_isLocked && !isBusy && !_isShaking,
                            defaultPinTheme: pinTheme,
                            focusedPinTheme: focusedPinTheme,
                            onChanged: (_) {
                              _errorText.value = null;
                              _numberNotRegistered.value = false;
                              _refreshUi();
                            },
                          ),
                          const SizedBox(height: 16),
                          OtpErrorMessage(errorText: _errorText),
                          const SizedBox(height: 4),
                          OtpResendButton(
                            secondsRemaining: _resendSecondsRemaining,
                            isBusy: isBusy,
                            isResending: auth.isResending,
                            onResend: _resendCode,
                          ),
                          OtpUnregisteredPrompt(visible: _numberNotRegistered, onRegister: _startRegistration),
                        ],
                      ),
                      ListenableBuilder(
                        listenable: Listenable.merge([_uiRevision, _pinController]),
                        builder: (context, _) => AuthContinueFooter(
                          isLoading: isBusy,
                          onPressed: !_isLocked && !_isShaking && !isBusy && _pinController.text.length == 6
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
