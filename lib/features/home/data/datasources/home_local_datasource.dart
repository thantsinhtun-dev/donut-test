import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../../../core/hive/hive_constant.dart';

class HomeLocalDatasource {
  HomeLocalDatasource() : _box = Hive.box<String>(HiveConstant.homeContentBox);

  static const _seedKey = 'homeContent_v6';
  static const _seedAsset = 'assets/data/home_seed.json';

  final Box<String> _box;

  Future<void> seedIfNeeded() async {
    if (_box.containsKey(_seedKey)) return;
    final bundledSeed = await rootBundle.loadString(_seedAsset);
    await _box.put(_seedKey, bundledSeed);
  }

  String readHomeContent() {
    final json = _box.get(_seedKey);
    if (json == null) {
      throw StateError('Home data has not been seeded.');
    }
    return json;
  }

  Future<void> saveHomeContent(String json) async {
    await _box.put(_seedKey, json);
  }
}
