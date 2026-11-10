import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_result.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/validators/auth_validators.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository, {AuthState initialState = const AuthState()}) : super(initialState);

  final AuthRepository _authRepository;

  bool get _isLoading => state.pageState == PageState.loading;

  void setPhoneErrorVisible(bool visible) {
    if (state.showPhoneError == visible) return;
    emit(state.copyWith(showPhoneError: visible));
  }

  Future<void> requestOtp({required String phoneNumber, required AuthMode mode}) async {
    if (_isLoading) return;
    emit(AuthState(phoneNumber: phoneNumber, mode: mode, pageState: PageState.loading, showPhoneError: false));
    final result = await _authRepository.sendOtp(phoneNumber);
    _emitResult(result);
  }

  Future<void> resendOtp() async {
    if (_isLoading) return;
    _emitLoading(isResending: true);
    final result = await _authRepository.sendOtp(state.phoneNumber);
    _emitResult(result);
  }

  Future<void> verifyOtp(String code) async {
    if (_isLoading) return;
    _emitLoading();
    final result = await _authRepository.verifyOtp(
      phoneNumber: state.phoneNumber,
      code: code,
      isLogin: state.mode == AuthMode.login,
    );
    switch (result) {
      case Success<OtpVerificationResult>(data: final verificationResult, message: final message):
        _emitSuccess(message, isLoggedIn: verificationResult == .authenticated ? true : null);
      case Failure<OtpVerificationResult>(message: final message):
        _emitFailure(message);
    }
  }

  void selectRegistration() {
    emit(
      state.copyWith(
        mode: AuthMode.register,
        firstName: '',
        lastName: '',
        birthMonth: '',
        birthDay: '',
        birthYear: '',
        dateOfBirth: '',
        pageState: PageState.idle,
        errorMessage: null,
        successMessage: null,
      ),
    );
  }

  void updateName({required String firstName, required String lastName}) {
    emit(
      state.copyWith(
        firstName: firstName.trim(),
        lastName: lastName.trim(),
        pageState: PageState.idle,
        errorMessage: null,
        successMessage: null,
      ),
    );
  }

  Future<void> submitName() async {
    if (_isLoading || !isValidFirstName(state.firstName) || !isValidLastName(state.lastName)) {
      return;
    }
    _emitLoading();
    final result = await _authRepository.validateName(firstName: state.firstName, lastName: state.lastName);
    _emitResult(result);
  }

  void updateBirthDateParts({required String month, required String day, required String year}) {
    emit(
      state.copyWith(
        birthMonth: month,
        birthDay: day,
        birthYear: year,
        pageState: PageState.idle,
        errorMessage: null,
        successMessage: null,
      ),
    );
  }

  Future<void> submitRegistration(String dateOfBirth) async {
    if (_isLoading ||
        !isValidFirstName(state.firstName) ||
        !isValidLastName(state.lastName) ||
        !isValidDateOfBirth(month: state.birthMonth, day: state.birthDay, year: state.birthYear)) {
      return;
    }
    emit(
      state.copyWith(dateOfBirth: dateOfBirth, pageState: PageState.loading, errorMessage: null, successMessage: null),
    );
    final result = await _authRepository.saveRegistration(
      AuthUser(
        phoneNumber: state.phoneNumber,
        firstName: state.firstName,
        lastName: state.lastName,
        dateOfBirth: dateOfBirth,
      ),
    );
    _emitResult(result);
  }

  Future<void> login() async {
    if (_isLoading) return;
    _emitLoading();
    final result = await _authRepository.logIn(state.phoneNumber);
    switch (result) {
      case Success<void>(message: final message):
        _emitSuccess(message, isLoggedIn: true);
      case Failure<void>(message: final message):
        _emitFailure(message);
    }
  }

  Future<void> logout() async {
    if (_isLoading) return;
    _emitLoading();
    final result = await _authRepository.logOut();
    switch (result) {
      case Success<void>(message: final message):
        emit(AuthState(pageState: PageState.success, successMessage: message));
      case Failure<void>(message: final message):
        _emitFailure(message);
    }
  }

  void _emitLoading({bool isResending = false}) => emit(
    state.copyWith(pageState: PageState.loading, errorMessage: null, successMessage: null, isResending: isResending),
  );

  void _emitSuccess(String message, {bool? isLoggedIn}) => emit(
    state.copyWith(
      pageState: PageState.success,
      errorMessage: null,
      successMessage: message,
      isResending: false,
      isLoggedIn: isLoggedIn ?? state.isLoggedIn,
    ),
  );

  void _emitFailure(String message) =>
      emit(state.copyWith(pageState: PageState.fail, errorMessage: message, successMessage: null, isResending: false));

  void _emitResult<T>(ApiResult<T> result) {
    switch (result) {
      case Success<T>(message: final message):
        _emitSuccess(message);
      case Failure<T>(message: final message):
        _emitFailure(message);
    }
  }
}
