import 'package:donut_test/core/hive/hive_constant.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/auth_user.dart';

class AuthUserDataSource {
  AuthUserDataSource() : _users = Hive.box<AuthUser>(HiveConstant.authBox);

  final Box<AuthUser> _users;

  bool isRegistered(String phoneNumber) => _users.containsKey(phoneNumber);

  AuthUser? getUser(String phoneNumber) => _users.get(phoneNumber);

  Future<void> saveUser(AuthUser user) => _users.put(user.phoneNumber, user);
}
