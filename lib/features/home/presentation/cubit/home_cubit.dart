import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repository, {InternetConnection? internetConnection})
    : _internetConnection =
          internetConnection ??
          InternetConnection.createInstance(
            triggerStream: Connectivity().onConnectivityChanged,
          ),
      _ownsInternetConnection = internetConnection == null,
      super(const HomeState());

  final HomeRepository _repository;
  final InternetConnection _internetConnection;
  final bool _ownsInternetConnection;
  StreamSubscription<InternetStatus>? _internetSubscription;

  Future<void> monitorConnectivity() async {
    if (_internetSubscription != null) return;

    _internetSubscription = _internetConnection.onStatusChange.listen(
      _handleInternetStatus,
      onError: (_) => _setOffline(true),
    );

    try {
      final hasInternet = await _internetConnection.hasInternetAccess;
      if (isClosed) return;
      _setOffline(!hasInternet);
      if (hasInternet) unawaited(refresh());
    } catch (_) {
      _setOffline(true);
    }
  }

  void _handleInternetStatus(InternetStatus status) {
    final wasOffline = state.isOffline;
    final isOffline = status == InternetStatus.disconnected;
    _setOffline(isOffline);
    if (wasOffline && !isOffline) unawaited(refresh());
  }

  void _setOffline(bool isOffline) {
    if (!isClosed && state.isOffline != isOffline) {
      emit(state.copyWith(isOffline: isOffline));
    }
  }

  Future<void> load() async {
    emit(state.copyWith(status: HomeStatus.loading, errorMessage: null));
    try {
      final content = await _repository.getHomeContent();
      emit(state.copyWith(status: HomeStatus.success, content: content));
    } catch (error) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> refresh() async {
    if (state.isOffline || state.isRefreshing) return;
    emit(state.copyWith(isRefreshing: true));
    try {
      final content = await _repository.refreshHomeContent();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          content: content,
          isRefreshing: false,
          errorMessage: null,
        ),
      );
    } catch (_) {
      // Keep the cached content visible and confirm whether the internet dropped.
      final hasInternet = await _internetConnection.hasInternetAccess
          .catchError((_) => false);
      emit(state.copyWith(isRefreshing: false, isOffline: !hasInternet));
    }
  }

  @override
  Future<void> close() async {
    await _internetSubscription?.cancel();
    if (_ownsInternetConnection) await _internetConnection.dispose();
    await super.close();
  }
}
