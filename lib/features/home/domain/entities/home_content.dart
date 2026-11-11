import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_content.freezed.dart';
part 'home_content.g.dart';

enum HomeSectionType { seasonal, products, shops }

@freezed
abstract class HomeContent with _$HomeContent {
  const factory HomeContent({
    required MemberProfile member,
    required List<HomeBanner> banners,
    required List<HomeSection> sections,
  }) = _HomeContent;

  factory HomeContent.fromJson(Map<String, dynamic> json) =>
      _$HomeContentFromJson(json);
}

@freezed
abstract class MemberProfile with _$MemberProfile {
  const factory MemberProfile({
    required String name,
    required String tier,
    required int notifications,
    required int pointsToNextTier,
    @Default(900000) int progressTargetPoints,
    required String nextTierName,
    required String followingTierName,
    required int totalPoints,
    required String avatarUrl,
    @Default('assets/images/member_avatar.png') String fallbackAsset,
  }) = _MemberProfile;

  factory MemberProfile.fromJson(Map<String, dynamic> json) =>
      _$MemberProfileFromJson(json);
}

@freezed
abstract class HomeBanner with _$HomeBanner {
  const factory HomeBanner({
    required String id,
    required String imageUrl,
    @Default('') String title,
    @Default('assets/images/promotion_central_boulevard.png')
    String fallbackAsset,
  }) = _HomeBanner;

  factory HomeBanner.fromJson(Map<String, dynamic> json) =>
      _$HomeBannerFromJson(json);
}

@freezed
abstract class HomeSection with _$HomeSection {
  const factory HomeSection({
    required String id,
    required String title,
    required HomeSectionType type,
    @Default([]) List<HomeProduct> products,
    @Default([]) List<HomeShop> shops,
  }) = _HomeSection;

  factory HomeSection.fromJson(Map<String, dynamic> json) =>
      _$HomeSectionFromJson(json);
}

@freezed
abstract class HomeProduct with _$HomeProduct {
  const factory HomeProduct({
    required String id,
    required String code,
    required String name,
    required int priceMmk,
    required bool isNew,
    required String imageUrl,
    required String description,
    int? discountPercent,
    @Default('assets/images/onboarding_donut.png') String fallbackAsset,
  }) = _HomeProduct;

  factory HomeProduct.fromJson(Map<String, dynamic> json) =>
      _$HomeProductFromJson(json);
}

@freezed
abstract class HomeShop with _$HomeShop {
  const factory HomeShop({
    required String id,
    required String name,
    required String address,
    required String imageUrl,
    required String actionLabel,
    @Default('assets/images/storefront_promo.png') String fallbackAsset,
  }) = _HomeShop;

  factory HomeShop.fromJson(Map<String, dynamic> json) =>
      _$HomeShopFromJson(json);
}
