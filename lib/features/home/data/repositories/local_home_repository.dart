import 'dart:convert';

import '../../domain/entities/home_content.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';
import '../datasources/home_remote_datasource.dart';

class LocalHomeRepository implements HomeRepository {
  LocalHomeRepository(this._datasource, this._remoteDatasource);

  final HomeLocalDatasource _datasource;
  final HomeRemoteDatasource _remoteDatasource;

  @override
  Future<void> seedIfNeeded() => _datasource.seedIfNeeded();

  @override
  Future<HomeContent> getHomeContent() async => HomeContent.fromJson(
    jsonDecode(_datasource.readHomeContent()) as Map<String, dynamic>,
  );

  @override
  Future<HomeContent> refreshHomeContent() async {
    final remoteJson = await _remoteDatasource.fetchHomeContent();
    if (remoteJson == null) return getHomeContent();

    final content = HomeContent.fromJson(
      jsonDecode(remoteJson) as Map<String, dynamic>,
    );
    await _datasource.saveHomeContent(remoteJson);
    return content;
  }
}
