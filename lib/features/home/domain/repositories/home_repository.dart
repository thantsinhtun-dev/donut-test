import '../entities/home_content.dart';

abstract interface class HomeRepository {
  Future<void> seedIfNeeded();

  Future<HomeContent> getHomeContent();

  Future<HomeContent> refreshHomeContent();
}
