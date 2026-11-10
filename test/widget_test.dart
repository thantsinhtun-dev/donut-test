// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:donut_test/core/network/api_result.dart';
import 'package:donut_test/core/network/response_status.dart';
import 'package:donut_test/core/di/app_blocs.dart';
import 'package:donut_test/features/auth/domain/entities/auth_user.dart';
import 'package:donut_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:donut_test/main.dart';

void main() {
  testWidgets('app opens to onboarding while signed out', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>.value(
            value: _TestAuthRepository(),
          ),
        ],
        child: const AppBlocs(child: MyApp()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text("LET'S GET STARTED"), findsOneWidget);
  });
}

class _TestAuthRepository implements AuthRepository {
  @override
  @override
  bool get isLoggedIn => false;

  @override
  String? get sessionPhone => null;

  @override
  FutureApiResult<void> sendOtp(String phoneNumber) async =>
      const ApiResult.success(null, message: 'Code sent.');

  @override
  FutureApiResult<OtpVerificationResult> verifyOtp({
    required String phoneNumber,
    required String code,
    required bool isLogin,
  }) async => const ApiResult.failure(
    ResponseStatus.invalidOtp,
    message: 'Incorrect code.',
  );

  @override
  FutureApiResult<void> validateName({
    required String firstName,
    required String lastName,
  }) async => const ApiResult.success(null, message: 'Name verified.');

  @override
  FutureApiResult<void> logIn(String phoneNumber) async =>
      const ApiResult.failure(
        ResponseStatus.unregisteredPhone,
        message: 'This number is not registered.',
      );

  @override
  FutureApiResult<void> logOut() async =>
      const ApiResult.success(null, message: 'Logged out.');

  @override
  FutureApiResult<void> saveRegistration(AuthUser user) async =>
      const ApiResult.success(null, message: 'Registration saved.');
}
