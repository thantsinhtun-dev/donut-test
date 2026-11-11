// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeContent _$HomeContentFromJson(Map<String, dynamic> json) => _HomeContent(
  member: MemberProfile.fromJson(json['member'] as Map<String, dynamic>),
  banners: (json['banners'] as List<dynamic>)
      .map((e) => HomeBanner.fromJson(e as Map<String, dynamic>))
      .toList(),
  sections: (json['sections'] as List<dynamic>)
      .map((e) => HomeSection.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeContentToJson(_HomeContent instance) =>
    <String, dynamic>{
      'member': instance.member,
      'banners': instance.banners,
      'sections': instance.sections,
    };

_MemberProfile _$MemberProfileFromJson(Map<String, dynamic> json) =>
    _MemberProfile(
      name: json['name'] as String,
      tier: json['tier'] as String,
      notifications: (json['notifications'] as num).toInt(),
      pointsToNextTier: (json['pointsToNextTier'] as num).toInt(),
      progressTargetPoints:
          (json['progressTargetPoints'] as num?)?.toInt() ?? 900000,
      nextTierName: json['nextTierName'] as String,
      followingTierName: json['followingTierName'] as String,
      totalPoints: (json['totalPoints'] as num).toInt(),
      avatarUrl: json['avatarUrl'] as String,
      fallbackAsset:
          json['fallbackAsset'] as String? ?? 'assets/images/member_avatar.png',
    );

Map<String, dynamic> _$MemberProfileToJson(_MemberProfile instance) =>
    <String, dynamic>{
      'name': instance.name,
      'tier': instance.tier,
      'notifications': instance.notifications,
      'pointsToNextTier': instance.pointsToNextTier,
      'progressTargetPoints': instance.progressTargetPoints,
      'nextTierName': instance.nextTierName,
      'followingTierName': instance.followingTierName,
      'totalPoints': instance.totalPoints,
      'avatarUrl': instance.avatarUrl,
      'fallbackAsset': instance.fallbackAsset,
    };

_HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) => _HomeBanner(
  id: json['id'] as String,
  imageUrl: json['imageUrl'] as String,
  title: json['title'] as String? ?? '',
  fallbackAsset:
      json['fallbackAsset'] as String? ??
      'assets/images/promotion_central_boulevard.png',
);

Map<String, dynamic> _$HomeBannerToJson(_HomeBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'fallbackAsset': instance.fallbackAsset,
    };

_HomeSection _$HomeSectionFromJson(Map<String, dynamic> json) => _HomeSection(
  id: json['id'] as String,
  title: json['title'] as String,
  type: $enumDecode(_$HomeSectionTypeEnumMap, json['type']),
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => HomeProduct.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shops:
      (json['shops'] as List<dynamic>?)
          ?.map((e) => HomeShop.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$HomeSectionToJson(_HomeSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': _$HomeSectionTypeEnumMap[instance.type]!,
      'products': instance.products,
      'shops': instance.shops,
    };

const _$HomeSectionTypeEnumMap = {
  HomeSectionType.seasonal: 'seasonal',
  HomeSectionType.products: 'products',
  HomeSectionType.shops: 'shops',
};

_HomeProduct _$HomeProductFromJson(Map<String, dynamic> json) => _HomeProduct(
  id: json['id'] as String,
  code: json['code'] as String,
  name: json['name'] as String,
  priceMmk: (json['priceMmk'] as num).toInt(),
  isNew: json['isNew'] as bool,
  imageUrl: json['imageUrl'] as String,
  description: json['description'] as String,
  discountPercent: (json['discountPercent'] as num?)?.toInt(),
  fallbackAsset:
      json['fallbackAsset'] as String? ?? 'assets/images/onboarding_donut.png',
);

Map<String, dynamic> _$HomeProductToJson(_HomeProduct instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'priceMmk': instance.priceMmk,
      'isNew': instance.isNew,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'discountPercent': instance.discountPercent,
      'fallbackAsset': instance.fallbackAsset,
    };

_HomeShop _$HomeShopFromJson(Map<String, dynamic> json) => _HomeShop(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  imageUrl: json['imageUrl'] as String,
  actionLabel: json['actionLabel'] as String,
  fallbackAsset:
      json['fallbackAsset'] as String? ?? 'assets/images/storefront_promo.png',
);

Map<String, dynamic> _$HomeShopToJson(_HomeShop instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'imageUrl': instance.imageUrl,
  'actionLabel': instance.actionLabel,
  'fallbackAsset': instance.fallbackAsset,
};
