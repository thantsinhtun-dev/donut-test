import '../../../../core/network/api_result.dart';
import '../../../../core/network/response_status.dart';
import '../../../../core/hive/datasources/app_local_datasource.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/validators/auth_validators.dart';
import '../datasources/auth_user_data_source.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository(this._userDataSource, this._appLocalDatasource);

  static const _responseDelay = Duration(seconds: 1);
  static const _codeSentMessage = 'Code sent.';
  static const _numberVerifiedMessage = 'Number verified.';
  static const _nameVerifiedMessage = 'Name verified.';
  static const _registrationSavedMessage = 'Registration saved.';
  static const _loggedInMessage = 'Logged in.';
  static const _loggedOutMessage = 'Logged out.';
  static const _invalidOtpMessage = 'Incorrect code.';
  static const _unregisteredPhoneMessage = 'This number is not registered.';

  final AuthUserDataSource _userDataSource;
  final AppLocalDatasource _appLocalDatasource;

  @override
  bool get isLoggedIn => sessionPhone != null;

  @override
  String? get sessionPhone => _appLocalDatasource.getSessionPhone();

  @override
  FutureApiResult<void> sendOtp(String phoneNumber) async {
    await Future<void>.delayed(_responseDelay);
    return const ApiResult.success(null, message: _codeSentMessage);
  }

  @override
  FutureApiResult<OtpVerificationResult> verifyOtp({
    required String phoneNumber,
    required String code,
    required bool isLogin,
  }) async {
    await Future<void>.delayed(_responseDelay);
    if (!isValidFakeOtp(code)) {
      return const ApiResult.failure(
        ResponseStatus.invalidOtp,
        message: _invalidOtpMessage,
      );
    }
    final isRegistered = _userDataSource.isRegistered(phoneNumber);
    if (!isRegistered && !isLogin) {
      return const ApiResult.success(
        OtpVerificationResult.verified,
        message: _numberVerifiedMessage,
      );
    }
    if (!isRegistered) {
      return const ApiResult.failure(
        ResponseStatus.unregisteredPhone,
        message: _unregisteredPhoneMessage,
      );
    }
    await _appLocalDatasource.saveSessionPhone(phoneNumber);
    return const ApiResult.success(
      OtpVerificationResult.authenticated,
      message: _loggedInMessage,
    );
  }

  @override
  FutureApiResult<void> validateName({
    required String firstName,
    required String lastName,
  }) async {
    await Future<void>.delayed(_responseDelay);
    return const ApiResult.success(null, message: _nameVerifiedMessage);
  }

  @override
  FutureApiResult<void> saveRegistration(AuthUser user) async {
    await Future<void>.delayed(_responseDelay);
    await _userDataSource.saveUser(user);
    return const ApiResult.success(null, message: _registrationSavedMessage);
  }

  @override
  FutureApiResult<void> logIn(String phoneNumber) async {
    await Future<void>.delayed(_responseDelay);
    if (!_userDataSource.isRegistered(phoneNumber)) {
      return const ApiResult.failure(
        ResponseStatus.unregisteredPhone,
        message: _unregisteredPhoneMessage,
      );
    }
    await _appLocalDatasource.saveSessionPhone(phoneNumber);
    return const ApiResult.success(null, message: _loggedInMessage);
  }

  @override
  FutureApiResult<void> logOut() async {
    await Future<void>.delayed(_responseDelay);
    await _appLocalDatasource.clearSessionPhone();
    return const ApiResult.success(null, message: _loggedOutMessage);
  }
}
