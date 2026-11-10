import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthMode { register, login }

enum PageState { idle, loading, success, fail }

abstract final class AuthPageMessages {
  static const codeSent = 'Code sent.';
  static const numberVerified = 'Number verified.';
  static const nameVerified = 'Name verified.';
  static const registrationSaved = 'Registration saved.';
  static const loggedIn = 'Logged in.';
  static const loggedOut = 'Logged out.';

  static const invalidOtp = 'Incorrect code.';
  static const unregisteredPhone = 'This number is not registered.';
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(PageState.idle) PageState pageState,
    String? errorMessage,
    String? successMessage,
    @Default(false) bool isResending,
    @Default(false) bool showPhoneError,
    @Default('') String phoneNumber,
    @Default(AuthMode.register) AuthMode mode,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String birthMonth,
    @Default('') String birthDay,
    @Default('') String birthYear,
    @Default('') String dateOfBirth,
    @Default(false) bool isLoggedIn,
  }) = _AuthState;
}
