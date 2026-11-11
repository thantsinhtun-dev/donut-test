import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/auth/domain/entities/auth_user.dart';
import 'hive_constant.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() {
    return _instance;
  }

  HiveService._internal();

  static Future<void> init() async {
    final directory = await getApplicationSupportDirectory();
    Hive.init(directory.path);
    const secureStorage = FlutterSecureStorage();

    Hive.registerAdapter(AuthUserAdapter());

    final hiveCipher = await generateHiveCipherIfNeeded(secureStorage);

    /// Register Hive Box
    await Hive.openBox<String>(
      HiveConstant.authSessionBox,
      encryptionCipher: hiveCipher,
    );
    await Hive.openBox<AuthUser>(
      HiveConstant.authBox,
      encryptionCipher: hiveCipher,
    );
    await Hive.openBox<String>(
      HiveConstant.homeContentBox,
      encryptionCipher: hiveCipher,
    );
  }

  static Future<HiveCipher> generateHiveCipherIfNeeded(
    FlutterSecureStorage secureStorage,
  ) async {
    String? encryptionKeyString = await secureStorage.read(key: 'key');
    if (encryptionKeyString == null) {
      encryptionKeyString = base64UrlEncode(Hive.generateSecureKey());
      await secureStorage.write(key: 'key', value: encryptionKeyString);
    }
    final encryptionKeyUint8List = base64Url.decode(encryptionKeyString);
    return HiveAesCipher(encryptionKeyUint8List);
  }
}
