import '../entities/auth_user.dart';
import '../../../../core/network/api_result.dart';

enum OtpVerificationResult { verified, authenticated }

abstract interface class AuthRepository {
  bool get isLoggedIn;
  String? get sessionPhone;
  FutureApiResult<void> sendOtp(String phoneNumber);
  FutureApiResult<OtpVerificationResult> verifyOtp({
    required String phoneNumber,
    required String code,
    required bool isLogin,
  });
  FutureApiResult<void> validateName({
    required String firstName,
    required String lastName,
  });
  FutureApiResult<void> saveRegistration(AuthUser user);
  FutureApiResult<void> logIn(String phoneNumber);
  FutureApiResult<void> logOut();
}
