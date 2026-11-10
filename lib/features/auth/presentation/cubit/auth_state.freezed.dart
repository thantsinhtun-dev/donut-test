// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 PageState get pageState; String? get errorMessage; String? get successMessage; bool get isResending; bool get showPhoneError; String get phoneNumber; AuthMode get mode; String get firstName; String get lastName; String get birthMonth; String get birthDay; String get birthYear; String get dateOfBirth; bool get isLoggedIn;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AuthState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.pageState, _this.pageState) || other.pageState == _this.pageState)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.successMessage, _this.successMessage) || other.successMessage == _this.successMessage)&&(identical(other.isResending, _this.isResending) || other.isResending == _this.isResending)&&(identical(other.showPhoneError, _this.showPhoneError) || other.showPhoneError == _this.showPhoneError)&&(identical(other.phoneNumber, _this.phoneNumber) || other.phoneNumber == _this.phoneNumber)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.birthMonth, _this.birthMonth) || other.birthMonth == _this.birthMonth)&&(identical(other.birthDay, _this.birthDay) || other.birthDay == _this.birthDay)&&(identical(other.birthYear, _this.birthYear) || other.birthYear == _this.birthYear)&&(identical(other.dateOfBirth, _this.dateOfBirth) || other.dateOfBirth == _this.dateOfBirth)&&(identical(other.isLoggedIn, _this.isLoggedIn) || other.isLoggedIn == _this.isLoggedIn));
}


@override
int get hashCode {
  final _this = this as AuthState;
  return Object.hash(runtimeType,_this.pageState,_this.errorMessage,_this.successMessage,_this.isResending,_this.showPhoneError,_this.phoneNumber,_this.mode,_this.firstName,_this.lastName,_this.birthMonth,_this.birthDay,_this.birthYear,_this.dateOfBirth,_this.isLoggedIn);
}

@override
String toString() {
  final _this = this as AuthState;
  return 'AuthState(pageState: ${_this.pageState}, errorMessage: ${_this.errorMessage}, successMessage: ${_this.successMessage}, isResending: ${_this.isResending}, showPhoneError: ${_this.showPhoneError}, phoneNumber: ${_this.phoneNumber}, mode: ${_this.mode}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, birthMonth: ${_this.birthMonth}, birthDay: ${_this.birthDay}, birthYear: ${_this.birthYear}, dateOfBirth: ${_this.dateOfBirth}, isLoggedIn: ${_this.isLoggedIn})';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 PageState pageState, String? errorMessage, String? successMessage, bool isResending, bool showPhoneError, String phoneNumber, AuthMode mode, String firstName, String lastName, String birthMonth, String birthDay, String birthYear, String dateOfBirth, bool isLoggedIn
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageState = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? isResending = null,Object? showPhoneError = null,Object? phoneNumber = null,Object? mode = null,Object? firstName = null,Object? lastName = null,Object? birthMonth = null,Object? birthDay = null,Object? birthYear = null,Object? dateOfBirth = null,Object? isLoggedIn = null,}) {
  return _then(AuthState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,showPhoneError: null == showPhoneError ? _self.showPhoneError : showPhoneError // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,birthMonth: null == birthMonth ? _self.birthMonth : birthMonth // ignore: cast_nullable_to_non_nullable
as String,birthDay: null == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as String,birthYear: null == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageState pageState,  String? errorMessage,  String? successMessage,  bool isResending,  bool showPhoneError,  String phoneNumber,  AuthMode mode,  String firstName,  String lastName,  String birthMonth,  String birthDay,  String birthYear,  String dateOfBirth,  bool isLoggedIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.pageState,_that.errorMessage,_that.successMessage,_that.isResending,_that.showPhoneError,_that.phoneNumber,_that.mode,_that.firstName,_that.lastName,_that.birthMonth,_that.birthDay,_that.birthYear,_that.dateOfBirth,_that.isLoggedIn);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageState pageState,  String? errorMessage,  String? successMessage,  bool isResending,  bool showPhoneError,  String phoneNumber,  AuthMode mode,  String firstName,  String lastName,  String birthMonth,  String birthDay,  String birthYear,  String dateOfBirth,  bool isLoggedIn)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.pageState,_that.errorMessage,_that.successMessage,_that.isResending,_that.showPhoneError,_that.phoneNumber,_that.mode,_that.firstName,_that.lastName,_that.birthMonth,_that.birthDay,_that.birthYear,_that.dateOfBirth,_that.isLoggedIn);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageState pageState,  String? errorMessage,  String? successMessage,  bool isResending,  bool showPhoneError,  String phoneNumber,  AuthMode mode,  String firstName,  String lastName,  String birthMonth,  String birthDay,  String birthYear,  String dateOfBirth,  bool isLoggedIn)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.pageState,_that.errorMessage,_that.successMessage,_that.isResending,_that.showPhoneError,_that.phoneNumber,_that.mode,_that.firstName,_that.lastName,_that.birthMonth,_that.birthDay,_that.birthYear,_that.dateOfBirth,_that.isLoggedIn);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.pageState = PageState.idle, this.errorMessage, this.successMessage, this.isResending = false, this.showPhoneError = false, this.phoneNumber = '', this.mode = AuthMode.register, this.firstName = '', this.lastName = '', this.birthMonth = '', this.birthDay = '', this.birthYear = '', this.dateOfBirth = '', this.isLoggedIn = false});
  

@override@JsonKey() final  PageState pageState;
@override final  String? errorMessage;
@override final  String? successMessage;
@override@JsonKey() final  bool isResending;
@override@JsonKey() final  bool showPhoneError;
@override@JsonKey() final  String phoneNumber;
@override@JsonKey() final  AuthMode mode;
@override@JsonKey() final  String firstName;
@override@JsonKey() final  String lastName;
@override@JsonKey() final  String birthMonth;
@override@JsonKey() final  String birthDay;
@override@JsonKey() final  String birthYear;
@override@JsonKey() final  String dateOfBirth;
@override@JsonKey() final  bool isLoggedIn;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.pageState, pageState) || other.pageState == pageState)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.isResending, isResending) || other.isResending == isResending)&&(identical(other.showPhoneError, showPhoneError) || other.showPhoneError == showPhoneError)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.birthMonth, birthMonth) || other.birthMonth == birthMonth)&&(identical(other.birthDay, birthDay) || other.birthDay == birthDay)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn));
}


@override
int get hashCode {
    return Object.hash(runtimeType,pageState,errorMessage,successMessage,isResending,showPhoneError,phoneNumber,mode,firstName,lastName,birthMonth,birthDay,birthYear,dateOfBirth,isLoggedIn);
}

@override
String toString() {
    return 'AuthState(pageState: $pageState, errorMessage: $errorMessage, successMessage: $successMessage, isResending: $isResending, showPhoneError: $showPhoneError, phoneNumber: $phoneNumber, mode: $mode, firstName: $firstName, lastName: $lastName, birthMonth: $birthMonth, birthDay: $birthDay, birthYear: $birthYear, dateOfBirth: $dateOfBirth, isLoggedIn: $isLoggedIn)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 PageState pageState, String? errorMessage, String? successMessage, bool isResending, bool showPhoneError, String phoneNumber, AuthMode mode, String firstName, String lastName, String birthMonth, String birthDay, String birthYear, String dateOfBirth, bool isLoggedIn
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageState = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? isResending = null,Object? showPhoneError = null,Object? phoneNumber = null,Object? mode = null,Object? firstName = null,Object? lastName = null,Object? birthMonth = null,Object? birthDay = null,Object? birthYear = null,Object? dateOfBirth = null,Object? isLoggedIn = null,}) {
  return _then(_AuthState(
pageState: null == pageState ? _self.pageState : pageState // ignore: cast_nullable_to_non_nullable
as PageState,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,isResending: null == isResending ? _self.isResending : isResending // ignore: cast_nullable_to_non_nullable
as bool,showPhoneError: null == showPhoneError ? _self.showPhoneError : showPhoneError // ignore: cast_nullable_to_non_nullable
as bool,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as AuthMode,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,birthMonth: null == birthMonth ? _self.birthMonth : birthMonth // ignore: cast_nullable_to_non_nullable
as String,birthDay: null == birthDay ? _self.birthDay : birthDay // ignore: cast_nullable_to_non_nullable
as String,birthYear: null == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
