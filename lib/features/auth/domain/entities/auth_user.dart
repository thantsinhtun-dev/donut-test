import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/hive/hive_constant.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
@HiveType(typeId: HiveConstant.authUserTypeId)
abstract class AuthUser with _$AuthUser {
  const AuthUser._();

  const factory AuthUser({
    @HiveField(0) required String phoneNumber,
    @HiveField(1) required String firstName,
    @HiveField(2) required String lastName,
    @HiveField(3) required String dateOfBirth,
  }) = _AuthUser;
}
