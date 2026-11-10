import 'dart:async';

import 'package:donut_test/core/network/api_result.dart';
import 'package:donut_test/features/auth/domain/entities/auth_user.dart';
import 'package:donut_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:donut_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:donut_test/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthCubit request guards', () {
    test('double submit persists registration only once', () async {
      final repository = _FakeAuthRepository();
      final cubit = _createCubit(
        repository,
        initialState: const AuthState(
          phoneNumber: '+959254135592',
          firstName: 'May',
          birthMonth: '1',
          birthDay: '1',
          birthYear: '2000',
        ),
      );

      final first = cubit.submitRegistration('2000-01-01');
      final second = cubit.submitRegistration('2000-01-01');
      repository.saveCompleter.complete(
        const ApiResult.success(
          null,
          message: AuthPageMessages.registrationSaved,
        ),
      );
      await Future.wait([first, second]);

      expect(repository.saveCalls, 1);
      expect(cubit.state.pageState, PageState.success);
      expect(cubit.state.successMessage, AuthPageMessages.registrationSaved);
      await cubit.close();
    });

    test('double login sends one repository request', () async {
      final repository = _FakeAuthRepository();
      final cubit = _createCubit(
        repository,
        initialState: const AuthState(phoneNumber: '+959254135592'),
      );

      final first = cubit.login();
      final second = cubit.login();
      repository.loginCompleter.complete(
        const ApiResult.success(null, message: AuthPageMessages.loggedIn),
      );
      await Future.wait([first, second]);

      expect(repository.loginCalls, 1);
      expect(cubit.state.pageState, PageState.success);
      expect(cubit.state.successMessage, AuthPageMessages.loggedIn);
      await cubit.close();
    });

    test('double phone submit sends one OTP request', () async {
      final repository = _FakeAuthRepository();
      final cubit = _createCubit(repository);

      final first = cubit.requestOtp(
        phoneNumber: '+959254135592',
        mode: AuthMode.register,
      );
      final second = cubit.requestOtp(
        phoneNumber: '+959254135592',
        mode: AuthMode.register,
      );
      repository.sendOtpCompleter.complete(
        const ApiResult.success(null, message: AuthPageMessages.codeSent),
      );
      await Future.wait([first, second]);

      expect(repository.sendOtpCalls, 1);
      expect(cubit.state.pageState, PageState.success);
      expect(cubit.state.successMessage, AuthPageMessages.codeSent);
      await cubit.close();
    });

    test('double OTP submit sends one verification request', () async {
      final repository = _FakeAuthRepository();
      final cubit = _createCubit(
        repository,
        initialState: const AuthState(phoneNumber: '+959254135592'),
      );

      final first = cubit.verifyOtp('123456');
      final second = cubit.verifyOtp('123456');
      repository.verifyOtpCompleter.complete(
        const ApiResult.success(
          OtpVerificationResult.verified,
          message: AuthPageMessages.numberVerified,
        ),
      );
      await Future.wait([first, second]);

      expect(repository.verifyOtpCalls, 1);
      expect(cubit.state.pageState, PageState.success);
      expect(cubit.state.successMessage, AuthPageMessages.numberVerified);
      await cubit.close();
    });

    test('double name submit sends one validation request', () async {
      final repository = _FakeAuthRepository();
      final cubit = _createCubit(
        repository,
        initialState: const AuthState(firstName: 'May', lastName: 'Win'),
      );

      final first = cubit.submitName();
      final second = cubit.submitName();
      repository.validateNameCompleter.complete(
        const ApiResult.success(null, message: AuthPageMessages.nameVerified),
      );
      await Future.wait([first, second]);

      expect(repository.validateNameCalls, 1);
      expect(cubit.state.pageState, PageState.success);
      expect(cubit.state.successMessage, AuthPageMessages.nameVerified);
      await cubit.close();
    });
  });
}

AuthCubit _createCubit(
  AuthRepository repository, {
  AuthState initialState = const AuthState(),
}) => AuthCubit(repository, initialState: initialState);

class _FakeAuthRepository implements AuthRepository {
  final saveCompleter = Completer<ApiResult<void>>();
  final loginCompleter = Completer<ApiResult<void>>();
  final sendOtpCompleter = Completer<ApiResult<void>>();
  final verifyOtpCompleter = Completer<ApiResult<OtpVerificationResult>>();
  final validateNameCompleter = Completer<ApiResult<void>>();
  int saveCalls = 0;
  int loginCalls = 0;
  int sendOtpCalls = 0;
  int verifyOtpCalls = 0;
  int validateNameCalls = 0;

  @override
  @override
  bool get isLoggedIn => false;

  @override
  String? get sessionPhone => null;

  @override
  FutureApiResult<void> sendOtp(String phoneNumber) {
    sendOtpCalls++;
    return sendOtpCompleter.future;
  }

  @override
  FutureApiResult<OtpVerificationResult> verifyOtp({
    required String phoneNumber,
    required String code,
    required bool isLogin,
  }) {
    verifyOtpCalls++;
    return verifyOtpCompleter.future;
  }

  @override
  FutureApiResult<void> validateName({
    required String firstName,
    required String lastName,
  }) {
    validateNameCalls++;
    return validateNameCompleter.future;
  }

  @override
  FutureApiResult<void> saveRegistration(AuthUser user) {
    saveCalls++;
    return saveCompleter.future;
  }

  @override
  FutureApiResult<void> logIn(String phoneNumber) {
    loginCalls++;
    return loginCompleter.future;
  }

  @override
  FutureApiResult<void> logOut() async =>
      const ApiResult.success(null, message: AuthPageMessages.loggedOut);
}
