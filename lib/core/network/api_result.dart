import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'response_status.dart';

part 'api_result.freezed.dart';

typedef FutureApiResult<T> = Future<ApiResult<T>>;

@freezed
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data, {required String message}) =
      Success<T>;

  const factory ApiResult.failure(
    ResponseStatus error, {
    required String message,
  }) = Failure<T>;
}
