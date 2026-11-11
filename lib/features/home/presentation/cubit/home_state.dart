import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/home_content.dart';

part 'home_state.freezed.dart';

enum HomeStatus { loading, success, failure }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.loading) HomeStatus status,
    @Default(false) bool isOffline,
    @Default(false) bool isRefreshing,
    HomeContent? content,
    String? errorMessage,
  }) = _HomeState;
}
