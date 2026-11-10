import 'package:hive_ce_flutter/hive_flutter.dart';

import '../hive_constant.dart';

class AppLocalDatasource {
  AppLocalDatasource() : _sessionBox = Hive.box<String>(HiveConstant.authSessionBox);

  final Box<String> _sessionBox;

  String? getSessionPhone() {
    final phone = _sessionBox.get(HiveConstant.authSessionPhone);
    return phone != null && phone.isNotEmpty ? phone : null;
  }

  Future<void> saveSessionPhone(String phoneNumber) => _sessionBox.put(HiveConstant.authSessionPhone, phoneNumber);

  Future<void> clearSessionPhone() => _sessionBox.delete(HiveConstant.authSessionPhone);
}
