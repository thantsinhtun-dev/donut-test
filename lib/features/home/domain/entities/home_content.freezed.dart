// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeContent {

 MemberProfile get member; List<HomeBanner> get banners; List<HomeSection> get sections;
/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeContentCopyWith<HomeContent> get copyWith => _$HomeContentCopyWithImpl<HomeContent>(this as HomeContent, _$identity);

  /// Serializes this HomeContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeContent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeContent&&(identical(other.member, _this.member) || other.member == _this.member)&&const DeepCollectionEquality().equals(other.banners, _this.banners)&&const DeepCollectionEquality().equals(other.sections, _this.sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeContent;
  return Object.hash(runtimeType,_this.member,const DeepCollectionEquality().hash(_this.banners),const DeepCollectionEquality().hash(_this.sections));
}

@override
String toString() {
  final _this = this as HomeContent;
  return 'HomeContent(member: ${_this.member}, banners: ${_this.banners}, sections: ${_this.sections})';
}


}

/// @nodoc
abstract mixin class $HomeContentCopyWith<$Res>  {
  factory $HomeContentCopyWith(HomeContent value, $Res Function(HomeContent) _then) = _$HomeContentCopyWithImpl;
@useResult
$Res call({
 MemberProfile member, List<HomeBanner> banners, List<HomeSection> sections
});


$MemberProfileCopyWith<$Res> get member;

}
/// @nodoc
class _$HomeContentCopyWithImpl<$Res>
    implements $HomeContentCopyWith<$Res> {
  _$HomeContentCopyWithImpl(this._self, this._then);

  final HomeContent _self;
  final $Res Function(HomeContent) _then;

/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? member = null,Object? banners = null,Object? sections = null,}) {
  return _then(HomeContent(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberProfile,banners: null == banners ? _self.banners : banners // ignore: cast_nullable_to_non_nullable
as List<HomeBanner>,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<HomeSection>,
  ));
}
/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberProfileCopyWith<$Res> get member {
  
  return $MemberProfileCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeContent].
extension HomeContentPatterns on HomeContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeContent value)  $default,){
final _that = this;
switch (_that) {
case _HomeContent():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeContent value)?  $default,){
final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MemberProfile member,  List<HomeBanner> banners,  List<HomeSection> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
return $default(_that.member,_that.banners,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MemberProfile member,  List<HomeBanner> banners,  List<HomeSection> sections)  $default,) {final _that = this;
switch (_that) {
case _HomeContent():
return $default(_that.member,_that.banners,_that.sections);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MemberProfile member,  List<HomeBanner> banners,  List<HomeSection> sections)?  $default,) {final _that = this;
switch (_that) {
case _HomeContent() when $default != null:
return $default(_that.member,_that.banners,_that.sections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeContent implements HomeContent {
  const _HomeContent({required this.member, required  List<HomeBanner> banners, required  List<HomeSection> sections}): _banners = banners,_sections = sections;
  factory _HomeContent.fromJson(Map<String, dynamic> json) => _$HomeContentFromJson(json);

@override final  MemberProfile member;
 final  List<HomeBanner> _banners;
@override List<HomeBanner> get banners {
  if (_banners is EqualUnmodifiableListView) return _banners;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_banners);
}

 final  List<HomeSection> _sections;
@override List<HomeSection> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeContentCopyWith<_HomeContent> get copyWith => __$HomeContentCopyWithImpl<_HomeContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeContentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeContent&&(identical(other.member, member) || other.member == member)&&const DeepCollectionEquality().equals(other.banners, _banners)&&const DeepCollectionEquality().equals(other.sections, _sections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,member,const DeepCollectionEquality().hash(_banners),const DeepCollectionEquality().hash(_sections));
}

@override
String toString() {
    return 'HomeContent(member: $member, banners: $banners, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$HomeContentCopyWith<$Res> implements $HomeContentCopyWith<$Res> {
  factory _$HomeContentCopyWith(_HomeContent value, $Res Function(_HomeContent) _then) = __$HomeContentCopyWithImpl;
@override @useResult
$Res call({
 MemberProfile member, List<HomeBanner> banners, List<HomeSection> sections
});


@override $MemberProfileCopyWith<$Res> get member;

}
/// @nodoc
class __$HomeContentCopyWithImpl<$Res>
    implements _$HomeContentCopyWith<$Res> {
  __$HomeContentCopyWithImpl(this._self, this._then);

  final _HomeContent _self;
  final $Res Function(_HomeContent) _then;

/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? member = null,Object? banners = null,Object? sections = null,}) {
  return _then(_HomeContent(
member: null == member ? _self.member : member // ignore: cast_nullable_to_non_nullable
as MemberProfile,banners: null == banners ? _self._banners : banners // ignore: cast_nullable_to_non_nullable
as List<HomeBanner>,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<HomeSection>,
  ));
}

/// Create a copy of HomeContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MemberProfileCopyWith<$Res> get member {
  
  return $MemberProfileCopyWith<$Res>(_self.member, (value) {
    return _then(_self.copyWith(member: value));
  });
}
}


/// @nodoc
mixin _$MemberProfile {

 String get name; String get tier; int get notifications; int get pointsToNextTier; int get progressTargetPoints; String get nextTierName; String get followingTierName; int get totalPoints; String get avatarUrl; String get fallbackAsset;
/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MemberProfileCopyWith<MemberProfile> get copyWith => _$MemberProfileCopyWithImpl<MemberProfile>(this as MemberProfile, _$identity);

  /// Serializes this MemberProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MemberProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MemberProfile&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.tier, _this.tier) || other.tier == _this.tier)&&(identical(other.notifications, _this.notifications) || other.notifications == _this.notifications)&&(identical(other.pointsToNextTier, _this.pointsToNextTier) || other.pointsToNextTier == _this.pointsToNextTier)&&(identical(other.progressTargetPoints, _this.progressTargetPoints) || other.progressTargetPoints == _this.progressTargetPoints)&&(identical(other.nextTierName, _this.nextTierName) || other.nextTierName == _this.nextTierName)&&(identical(other.followingTierName, _this.followingTierName) || other.followingTierName == _this.followingTierName)&&(identical(other.totalPoints, _this.totalPoints) || other.totalPoints == _this.totalPoints)&&(identical(other.avatarUrl, _this.avatarUrl) || other.avatarUrl == _this.avatarUrl)&&(identical(other.fallbackAsset, _this.fallbackAsset) || other.fallbackAsset == _this.fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MemberProfile;
  return Object.hash(runtimeType,_this.name,_this.tier,_this.notifications,_this.pointsToNextTier,_this.progressTargetPoints,_this.nextTierName,_this.followingTierName,_this.totalPoints,_this.avatarUrl,_this.fallbackAsset);
}

@override
String toString() {
  final _this = this as MemberProfile;
  return 'MemberProfile(name: ${_this.name}, tier: ${_this.tier}, notifications: ${_this.notifications}, pointsToNextTier: ${_this.pointsToNextTier}, progressTargetPoints: ${_this.progressTargetPoints}, nextTierName: ${_this.nextTierName}, followingTierName: ${_this.followingTierName}, totalPoints: ${_this.totalPoints}, avatarUrl: ${_this.avatarUrl}, fallbackAsset: ${_this.fallbackAsset})';
}


}

/// @nodoc
abstract mixin class $MemberProfileCopyWith<$Res>  {
  factory $MemberProfileCopyWith(MemberProfile value, $Res Function(MemberProfile) _then) = _$MemberProfileCopyWithImpl;
@useResult
$Res call({
 String name, String tier, int notifications, int pointsToNextTier, int progressTargetPoints, String nextTierName, String followingTierName, int totalPoints, String avatarUrl, String fallbackAsset
});




}
/// @nodoc
class _$MemberProfileCopyWithImpl<$Res>
    implements $MemberProfileCopyWith<$Res> {
  _$MemberProfileCopyWithImpl(this._self, this._then);

  final MemberProfile _self;
  final $Res Function(MemberProfile) _then;

/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? tier = null,Object? notifications = null,Object? pointsToNextTier = null,Object? progressTargetPoints = null,Object? nextTierName = null,Object? followingTierName = null,Object? totalPoints = null,Object? avatarUrl = null,Object? fallbackAsset = null,}) {
  return _then(MemberProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as int,pointsToNextTier: null == pointsToNextTier ? _self.pointsToNextTier : pointsToNextTier // ignore: cast_nullable_to_non_nullable
as int,progressTargetPoints: null == progressTargetPoints ? _self.progressTargetPoints : progressTargetPoints // ignore: cast_nullable_to_non_nullable
as int,nextTierName: null == nextTierName ? _self.nextTierName : nextTierName // ignore: cast_nullable_to_non_nullable
as String,followingTierName: null == followingTierName ? _self.followingTierName : followingTierName // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MemberProfile].
extension MemberProfilePatterns on MemberProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MemberProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MemberProfile value)  $default,){
final _that = this;
switch (_that) {
case _MemberProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MemberProfile value)?  $default,){
final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String tier,  int notifications,  int pointsToNextTier,  int progressTargetPoints,  String nextTierName,  String followingTierName,  int totalPoints,  String avatarUrl,  String fallbackAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
return $default(_that.name,_that.tier,_that.notifications,_that.pointsToNextTier,_that.progressTargetPoints,_that.nextTierName,_that.followingTierName,_that.totalPoints,_that.avatarUrl,_that.fallbackAsset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String tier,  int notifications,  int pointsToNextTier,  int progressTargetPoints,  String nextTierName,  String followingTierName,  int totalPoints,  String avatarUrl,  String fallbackAsset)  $default,) {final _that = this;
switch (_that) {
case _MemberProfile():
return $default(_that.name,_that.tier,_that.notifications,_that.pointsToNextTier,_that.progressTargetPoints,_that.nextTierName,_that.followingTierName,_that.totalPoints,_that.avatarUrl,_that.fallbackAsset);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String tier,  int notifications,  int pointsToNextTier,  int progressTargetPoints,  String nextTierName,  String followingTierName,  int totalPoints,  String avatarUrl,  String fallbackAsset)?  $default,) {final _that = this;
switch (_that) {
case _MemberProfile() when $default != null:
return $default(_that.name,_that.tier,_that.notifications,_that.pointsToNextTier,_that.progressTargetPoints,_that.nextTierName,_that.followingTierName,_that.totalPoints,_that.avatarUrl,_that.fallbackAsset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MemberProfile implements MemberProfile {
  const _MemberProfile({required this.name, required this.tier, required this.notifications, required this.pointsToNextTier, this.progressTargetPoints = 900000, required this.nextTierName, required this.followingTierName, required this.totalPoints, required this.avatarUrl, this.fallbackAsset = 'assets/images/member_avatar.png'});
  factory _MemberProfile.fromJson(Map<String, dynamic> json) => _$MemberProfileFromJson(json);

@override final  String name;
@override final  String tier;
@override final  int notifications;
@override final  int pointsToNextTier;
@override@JsonKey() final  int progressTargetPoints;
@override final  String nextTierName;
@override final  String followingTierName;
@override final  int totalPoints;
@override final  String avatarUrl;
@override@JsonKey() final  String fallbackAsset;

/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MemberProfileCopyWith<_MemberProfile> get copyWith => __$MemberProfileCopyWithImpl<_MemberProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MemberProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MemberProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.pointsToNextTier, pointsToNextTier) || other.pointsToNextTier == pointsToNextTier)&&(identical(other.progressTargetPoints, progressTargetPoints) || other.progressTargetPoints == progressTargetPoints)&&(identical(other.nextTierName, nextTierName) || other.nextTierName == nextTierName)&&(identical(other.followingTierName, followingTierName) || other.followingTierName == followingTierName)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.fallbackAsset, fallbackAsset) || other.fallbackAsset == fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,tier,notifications,pointsToNextTier,progressTargetPoints,nextTierName,followingTierName,totalPoints,avatarUrl,fallbackAsset);
}

@override
String toString() {
    return 'MemberProfile(name: $name, tier: $tier, notifications: $notifications, pointsToNextTier: $pointsToNextTier, progressTargetPoints: $progressTargetPoints, nextTierName: $nextTierName, followingTierName: $followingTierName, totalPoints: $totalPoints, avatarUrl: $avatarUrl, fallbackAsset: $fallbackAsset)';
}


}

/// @nodoc
abstract mixin class _$MemberProfileCopyWith<$Res> implements $MemberProfileCopyWith<$Res> {
  factory _$MemberProfileCopyWith(_MemberProfile value, $Res Function(_MemberProfile) _then) = __$MemberProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String tier, int notifications, int pointsToNextTier, int progressTargetPoints, String nextTierName, String followingTierName, int totalPoints, String avatarUrl, String fallbackAsset
});




}
/// @nodoc
class __$MemberProfileCopyWithImpl<$Res>
    implements _$MemberProfileCopyWith<$Res> {
  __$MemberProfileCopyWithImpl(this._self, this._then);

  final _MemberProfile _self;
  final $Res Function(_MemberProfile) _then;

/// Create a copy of MemberProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? tier = null,Object? notifications = null,Object? pointsToNextTier = null,Object? progressTargetPoints = null,Object? nextTierName = null,Object? followingTierName = null,Object? totalPoints = null,Object? avatarUrl = null,Object? fallbackAsset = null,}) {
  return _then(_MemberProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as int,pointsToNextTier: null == pointsToNextTier ? _self.pointsToNextTier : pointsToNextTier // ignore: cast_nullable_to_non_nullable
as int,progressTargetPoints: null == progressTargetPoints ? _self.progressTargetPoints : progressTargetPoints // ignore: cast_nullable_to_non_nullable
as int,nextTierName: null == nextTierName ? _self.nextTierName : nextTierName // ignore: cast_nullable_to_non_nullable
as String,followingTierName: null == followingTierName ? _self.followingTierName : followingTierName // ignore: cast_nullable_to_non_nullable
as String,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeBanner {

 String get id; String get imageUrl; String get title; String get fallbackAsset;
/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBannerCopyWith<HomeBanner> get copyWith => _$HomeBannerCopyWithImpl<HomeBanner>(this as HomeBanner, _$identity);

  /// Serializes this HomeBanner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeBanner;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBanner&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.fallbackAsset, _this.fallbackAsset) || other.fallbackAsset == _this.fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeBanner;
  return Object.hash(runtimeType,_this.id,_this.imageUrl,_this.title,_this.fallbackAsset);
}

@override
String toString() {
  final _this = this as HomeBanner;
  return 'HomeBanner(id: ${_this.id}, imageUrl: ${_this.imageUrl}, title: ${_this.title}, fallbackAsset: ${_this.fallbackAsset})';
}


}

/// @nodoc
abstract mixin class $HomeBannerCopyWith<$Res>  {
  factory $HomeBannerCopyWith(HomeBanner value, $Res Function(HomeBanner) _then) = _$HomeBannerCopyWithImpl;
@useResult
$Res call({
 String id, String imageUrl, String title, String fallbackAsset
});




}
/// @nodoc
class _$HomeBannerCopyWithImpl<$Res>
    implements $HomeBannerCopyWith<$Res> {
  _$HomeBannerCopyWithImpl(this._self, this._then);

  final HomeBanner _self;
  final $Res Function(HomeBanner) _then;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? title = null,Object? fallbackAsset = null,}) {
  return _then(HomeBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeBanner].
extension HomeBannerPatterns on HomeBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeBanner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeBanner value)  $default,){
final _that = this;
switch (_that) {
case _HomeBanner():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeBanner value)?  $default,){
final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String title,  String fallbackAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.fallbackAsset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String title,  String fallbackAsset)  $default,) {final _that = this;
switch (_that) {
case _HomeBanner():
return $default(_that.id,_that.imageUrl,_that.title,_that.fallbackAsset);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imageUrl,  String title,  String fallbackAsset)?  $default,) {final _that = this;
switch (_that) {
case _HomeBanner() when $default != null:
return $default(_that.id,_that.imageUrl,_that.title,_that.fallbackAsset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeBanner implements HomeBanner {
  const _HomeBanner({required this.id, required this.imageUrl, this.title = '', this.fallbackAsset = 'assets/images/promotion_central_boulevard.png'});
  factory _HomeBanner.fromJson(Map<String, dynamic> json) => _$HomeBannerFromJson(json);

@override final  String id;
@override final  String imageUrl;
@override@JsonKey() final  String title;
@override@JsonKey() final  String fallbackAsset;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBannerCopyWith<_HomeBanner> get copyWith => __$HomeBannerCopyWithImpl<_HomeBanner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeBannerToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBanner&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title)&&(identical(other.fallbackAsset, fallbackAsset) || other.fallbackAsset == fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,imageUrl,title,fallbackAsset);
}

@override
String toString() {
    return 'HomeBanner(id: $id, imageUrl: $imageUrl, title: $title, fallbackAsset: $fallbackAsset)';
}


}

/// @nodoc
abstract mixin class _$HomeBannerCopyWith<$Res> implements $HomeBannerCopyWith<$Res> {
  factory _$HomeBannerCopyWith(_HomeBanner value, $Res Function(_HomeBanner) _then) = __$HomeBannerCopyWithImpl;
@override @useResult
$Res call({
 String id, String imageUrl, String title, String fallbackAsset
});




}
/// @nodoc
class __$HomeBannerCopyWithImpl<$Res>
    implements _$HomeBannerCopyWith<$Res> {
  __$HomeBannerCopyWithImpl(this._self, this._then);

  final _HomeBanner _self;
  final $Res Function(_HomeBanner) _then;

/// Create a copy of HomeBanner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? title = null,Object? fallbackAsset = null,}) {
  return _then(_HomeBanner(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeSection {

 String get id; String get title; HomeSectionType get type; List<HomeProduct> get products; List<HomeShop> get shops;
/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeSectionCopyWith<HomeSection> get copyWith => _$HomeSectionCopyWithImpl<HomeSection>(this as HomeSection, _$identity);

  /// Serializes this HomeSection to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeSection;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeSection&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.products, _this.products)&&const DeepCollectionEquality().equals(other.shops, _this.shops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeSection;
  return Object.hash(runtimeType,_this.id,_this.title,_this.type,const DeepCollectionEquality().hash(_this.products),const DeepCollectionEquality().hash(_this.shops));
}

@override
String toString() {
  final _this = this as HomeSection;
  return 'HomeSection(id: ${_this.id}, title: ${_this.title}, type: ${_this.type}, products: ${_this.products}, shops: ${_this.shops})';
}


}

/// @nodoc
abstract mixin class $HomeSectionCopyWith<$Res>  {
  factory $HomeSectionCopyWith(HomeSection value, $Res Function(HomeSection) _then) = _$HomeSectionCopyWithImpl;
@useResult
$Res call({
 String id, String title, HomeSectionType type, List<HomeProduct> products, List<HomeShop> shops
});




}
/// @nodoc
class _$HomeSectionCopyWithImpl<$Res>
    implements $HomeSectionCopyWith<$Res> {
  _$HomeSectionCopyWithImpl(this._self, this._then);

  final HomeSection _self;
  final $Res Function(HomeSection) _then;

/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? type = null,Object? products = null,Object? shops = null,}) {
  return _then(HomeSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HomeSectionType,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<HomeProduct>,shops: null == shops ? _self.shops : shops // ignore: cast_nullable_to_non_nullable
as List<HomeShop>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeSection].
extension HomeSectionPatterns on HomeSection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeSection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeSection value)  $default,){
final _that = this;
switch (_that) {
case _HomeSection():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeSection value)?  $default,){
final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  HomeSectionType type,  List<HomeProduct> products,  List<HomeShop> shops)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.products,_that.shops);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  HomeSectionType type,  List<HomeProduct> products,  List<HomeShop> shops)  $default,) {final _that = this;
switch (_that) {
case _HomeSection():
return $default(_that.id,_that.title,_that.type,_that.products,_that.shops);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  HomeSectionType type,  List<HomeProduct> products,  List<HomeShop> shops)?  $default,) {final _that = this;
switch (_that) {
case _HomeSection() when $default != null:
return $default(_that.id,_that.title,_that.type,_that.products,_that.shops);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeSection implements HomeSection {
  const _HomeSection({required this.id, required this.title, required this.type,  List<HomeProduct> products = const [],  List<HomeShop> shops = const []}): _products = products,_shops = shops;
  factory _HomeSection.fromJson(Map<String, dynamic> json) => _$HomeSectionFromJson(json);

@override final  String id;
@override final  String title;
@override final  HomeSectionType type;
 final  List<HomeProduct> _products;
@override@JsonKey() List<HomeProduct> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  List<HomeShop> _shops;
@override@JsonKey() List<HomeShop> get shops {
  if (_shops is EqualUnmodifiableListView) return _shops;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shops);
}


/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeSectionCopyWith<_HomeSection> get copyWith => __$HomeSectionCopyWithImpl<_HomeSection>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeSectionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeSection&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.products, _products)&&const DeepCollectionEquality().equals(other.shops, _shops));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,type,const DeepCollectionEquality().hash(_products),const DeepCollectionEquality().hash(_shops));
}

@override
String toString() {
    return 'HomeSection(id: $id, title: $title, type: $type, products: $products, shops: $shops)';
}


}

/// @nodoc
abstract mixin class _$HomeSectionCopyWith<$Res> implements $HomeSectionCopyWith<$Res> {
  factory _$HomeSectionCopyWith(_HomeSection value, $Res Function(_HomeSection) _then) = __$HomeSectionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, HomeSectionType type, List<HomeProduct> products, List<HomeShop> shops
});




}
/// @nodoc
class __$HomeSectionCopyWithImpl<$Res>
    implements _$HomeSectionCopyWith<$Res> {
  __$HomeSectionCopyWithImpl(this._self, this._then);

  final _HomeSection _self;
  final $Res Function(_HomeSection) _then;

/// Create a copy of HomeSection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? type = null,Object? products = null,Object? shops = null,}) {
  return _then(_HomeSection(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as HomeSectionType,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<HomeProduct>,shops: null == shops ? _self._shops : shops // ignore: cast_nullable_to_non_nullable
as List<HomeShop>,
  ));
}


}


/// @nodoc
mixin _$HomeProduct {

 String get id; String get code; String get name; int get priceMmk; bool get isNew; String get imageUrl; String get description; int? get discountPercent; String get fallbackAsset;
/// Create a copy of HomeProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeProductCopyWith<HomeProduct> get copyWith => _$HomeProductCopyWithImpl<HomeProduct>(this as HomeProduct, _$identity);

  /// Serializes this HomeProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeProduct;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeProduct&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.code, _this.code) || other.code == _this.code)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.priceMmk, _this.priceMmk) || other.priceMmk == _this.priceMmk)&&(identical(other.isNew, _this.isNew) || other.isNew == _this.isNew)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.discountPercent, _this.discountPercent) || other.discountPercent == _this.discountPercent)&&(identical(other.fallbackAsset, _this.fallbackAsset) || other.fallbackAsset == _this.fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeProduct;
  return Object.hash(runtimeType,_this.id,_this.code,_this.name,_this.priceMmk,_this.isNew,_this.imageUrl,_this.description,_this.discountPercent,_this.fallbackAsset);
}

@override
String toString() {
  final _this = this as HomeProduct;
  return 'HomeProduct(id: ${_this.id}, code: ${_this.code}, name: ${_this.name}, priceMmk: ${_this.priceMmk}, isNew: ${_this.isNew}, imageUrl: ${_this.imageUrl}, description: ${_this.description}, discountPercent: ${_this.discountPercent}, fallbackAsset: ${_this.fallbackAsset})';
}


}

/// @nodoc
abstract mixin class $HomeProductCopyWith<$Res>  {
  factory $HomeProductCopyWith(HomeProduct value, $Res Function(HomeProduct) _then) = _$HomeProductCopyWithImpl;
@useResult
$Res call({
 String id, String code, String name, int priceMmk, bool isNew, String imageUrl, String description, int? discountPercent, String fallbackAsset
});




}
/// @nodoc
class _$HomeProductCopyWithImpl<$Res>
    implements $HomeProductCopyWith<$Res> {
  _$HomeProductCopyWithImpl(this._self, this._then);

  final HomeProduct _self;
  final $Res Function(HomeProduct) _then;

/// Create a copy of HomeProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? priceMmk = null,Object? isNew = null,Object? imageUrl = null,Object? description = null,Object? discountPercent = freezed,Object? fallbackAsset = null,}) {
  return _then(HomeProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceMmk: null == priceMmk ? _self.priceMmk : priceMmk // ignore: cast_nullable_to_non_nullable
as int,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeProduct].
extension HomeProductPatterns on HomeProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeProduct value)  $default,){
final _that = this;
switch (_that) {
case _HomeProduct():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeProduct value)?  $default,){
final _that = this;
switch (_that) {
case _HomeProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  String imageUrl,  String description,  int? discountPercent,  String fallbackAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeProduct() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.imageUrl,_that.description,_that.discountPercent,_that.fallbackAsset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  String imageUrl,  String description,  int? discountPercent,  String fallbackAsset)  $default,) {final _that = this;
switch (_that) {
case _HomeProduct():
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.imageUrl,_that.description,_that.discountPercent,_that.fallbackAsset);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  String name,  int priceMmk,  bool isNew,  String imageUrl,  String description,  int? discountPercent,  String fallbackAsset)?  $default,) {final _that = this;
switch (_that) {
case _HomeProduct() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.priceMmk,_that.isNew,_that.imageUrl,_that.description,_that.discountPercent,_that.fallbackAsset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeProduct implements HomeProduct {
  const _HomeProduct({required this.id, required this.code, required this.name, required this.priceMmk, required this.isNew, required this.imageUrl, required this.description, this.discountPercent, this.fallbackAsset = 'assets/images/onboarding_donut.png'});
  factory _HomeProduct.fromJson(Map<String, dynamic> json) => _$HomeProductFromJson(json);

@override final  String id;
@override final  String code;
@override final  String name;
@override final  int priceMmk;
@override final  bool isNew;
@override final  String imageUrl;
@override final  String description;
@override final  int? discountPercent;
@override@JsonKey() final  String fallbackAsset;

/// Create a copy of HomeProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeProductCopyWith<_HomeProduct> get copyWith => __$HomeProductCopyWithImpl<_HomeProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeProductToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeProduct&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.priceMmk, priceMmk) || other.priceMmk == priceMmk)&&(identical(other.isNew, isNew) || other.isNew == isNew)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.fallbackAsset, fallbackAsset) || other.fallbackAsset == fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,code,name,priceMmk,isNew,imageUrl,description,discountPercent,fallbackAsset);
}

@override
String toString() {
    return 'HomeProduct(id: $id, code: $code, name: $name, priceMmk: $priceMmk, isNew: $isNew, imageUrl: $imageUrl, description: $description, discountPercent: $discountPercent, fallbackAsset: $fallbackAsset)';
}


}

/// @nodoc
abstract mixin class _$HomeProductCopyWith<$Res> implements $HomeProductCopyWith<$Res> {
  factory _$HomeProductCopyWith(_HomeProduct value, $Res Function(_HomeProduct) _then) = __$HomeProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, String name, int priceMmk, bool isNew, String imageUrl, String description, int? discountPercent, String fallbackAsset
});




}
/// @nodoc
class __$HomeProductCopyWithImpl<$Res>
    implements _$HomeProductCopyWith<$Res> {
  __$HomeProductCopyWithImpl(this._self, this._then);

  final _HomeProduct _self;
  final $Res Function(_HomeProduct) _then;

/// Create a copy of HomeProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? priceMmk = null,Object? isNew = null,Object? imageUrl = null,Object? description = null,Object? discountPercent = freezed,Object? fallbackAsset = null,}) {
  return _then(_HomeProduct(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,priceMmk: null == priceMmk ? _self.priceMmk : priceMmk // ignore: cast_nullable_to_non_nullable
as int,isNew: null == isNew ? _self.isNew : isNew // ignore: cast_nullable_to_non_nullable
as bool,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as int?,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HomeShop {

 String get id; String get name; String get address; String get imageUrl; String get actionLabel; String get fallbackAsset;
/// Create a copy of HomeShop
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeShopCopyWith<HomeShop> get copyWith => _$HomeShopCopyWithImpl<HomeShop>(this as HomeShop, _$identity);

  /// Serializes this HomeShop to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HomeShop;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeShop&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.actionLabel, _this.actionLabel) || other.actionLabel == _this.actionLabel)&&(identical(other.fallbackAsset, _this.fallbackAsset) || other.fallbackAsset == _this.fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HomeShop;
  return Object.hash(runtimeType,_this.id,_this.name,_this.address,_this.imageUrl,_this.actionLabel,_this.fallbackAsset);
}

@override
String toString() {
  final _this = this as HomeShop;
  return 'HomeShop(id: ${_this.id}, name: ${_this.name}, address: ${_this.address}, imageUrl: ${_this.imageUrl}, actionLabel: ${_this.actionLabel}, fallbackAsset: ${_this.fallbackAsset})';
}


}

/// @nodoc
abstract mixin class $HomeShopCopyWith<$Res>  {
  factory $HomeShopCopyWith(HomeShop value, $Res Function(HomeShop) _then) = _$HomeShopCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String imageUrl, String actionLabel, String fallbackAsset
});




}
/// @nodoc
class _$HomeShopCopyWithImpl<$Res>
    implements $HomeShopCopyWith<$Res> {
  _$HomeShopCopyWithImpl(this._self, this._then);

  final HomeShop _self;
  final $Res Function(HomeShop) _then;

/// Create a copy of HomeShop
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? imageUrl = null,Object? actionLabel = null,Object? fallbackAsset = null,}) {
  return _then(HomeShop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,actionLabel: null == actionLabel ? _self.actionLabel : actionLabel // ignore: cast_nullable_to_non_nullable
as String,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeShop].
extension HomeShopPatterns on HomeShop {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeShop value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeShop() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeShop value)  $default,){
final _that = this;
switch (_that) {
case _HomeShop():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeShop value)?  $default,){
final _that = this;
switch (_that) {
case _HomeShop() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String imageUrl,  String actionLabel,  String fallbackAsset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeShop() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.imageUrl,_that.actionLabel,_that.fallbackAsset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String imageUrl,  String actionLabel,  String fallbackAsset)  $default,) {final _that = this;
switch (_that) {
case _HomeShop():
return $default(_that.id,_that.name,_that.address,_that.imageUrl,_that.actionLabel,_that.fallbackAsset);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String imageUrl,  String actionLabel,  String fallbackAsset)?  $default,) {final _that = this;
switch (_that) {
case _HomeShop() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.imageUrl,_that.actionLabel,_that.fallbackAsset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HomeShop implements HomeShop {
  const _HomeShop({required this.id, required this.name, required this.address, required this.imageUrl, required this.actionLabel, this.fallbackAsset = 'assets/images/storefront_promo.png'});
  factory _HomeShop.fromJson(Map<String, dynamic> json) => _$HomeShopFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String imageUrl;
@override final  String actionLabel;
@override@JsonKey() final  String fallbackAsset;

/// Create a copy of HomeShop
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeShopCopyWith<_HomeShop> get copyWith => __$HomeShopCopyWithImpl<_HomeShop>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HomeShopToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeShop&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.actionLabel, actionLabel) || other.actionLabel == actionLabel)&&(identical(other.fallbackAsset, fallbackAsset) || other.fallbackAsset == fallbackAsset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,address,imageUrl,actionLabel,fallbackAsset);
}

@override
String toString() {
    return 'HomeShop(id: $id, name: $name, address: $address, imageUrl: $imageUrl, actionLabel: $actionLabel, fallbackAsset: $fallbackAsset)';
}


}

/// @nodoc
abstract mixin class _$HomeShopCopyWith<$Res> implements $HomeShopCopyWith<$Res> {
  factory _$HomeShopCopyWith(_HomeShop value, $Res Function(_HomeShop) _then) = __$HomeShopCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String imageUrl, String actionLabel, String fallbackAsset
});




}
/// @nodoc
class __$HomeShopCopyWithImpl<$Res>
    implements _$HomeShopCopyWith<$Res> {
  __$HomeShopCopyWithImpl(this._self, this._then);

  final _HomeShop _self;
  final $Res Function(_HomeShop) _then;

/// Create a copy of HomeShop
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? imageUrl = null,Object? actionLabel = null,Object? fallbackAsset = null,}) {
  return _then(_HomeShop(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,actionLabel: null == actionLabel ? _self.actionLabel : actionLabel // ignore: cast_nullable_to_non_nullable
as String,fallbackAsset: null == fallbackAsset ? _self.fallbackAsset : fallbackAsset // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
