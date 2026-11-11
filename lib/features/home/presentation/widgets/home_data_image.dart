import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';

/// Displays bundled assets or remote images, caching remote images on disk.
class HomeDataImage extends StatelessWidget {
  const HomeDataImage({
    required this.imageUrl,
    this.fallbackAsset,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    super.key,
  });

  final String imageUrl;
  final String? fallbackAsset;
  final BoxFit fit;
  final Alignment alignment;
  final double? width;
  final double? height;

  bool get _isNetworkImage {
    final uri = Uri.tryParse(imageUrl);
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isNetworkImage) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        errorBuilder: (context, error, stackTrace) => _fallback(isError: true),
      );
    }

    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      placeholder: (context, url) => _fallback(),
      errorWidget: (context, url, error) => _fallback(isError: true),
    );
  }

  Widget _fallback({bool isError = false}) {
    final asset = fallbackAsset;
    final fallback = asset == null || asset.isEmpty
        ? const ColoredBox(
            color: Color(0xFFF2F3F4),
            child: Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: Color(0xFF9AA0A6),
              ),
            ),
          )
        : Image.asset(
            asset,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            errorBuilder: (context, error, stackTrace) => const ColoredBox(
              color: Color(0xFFF2F3F4),
              child: Center(
                child: Icon(
                  Icons.image_not_supported_outlined,
                  color: Color(0xFF9AA0A6),
                ),
              ),
            ),
          );

    if (!isError) return fallback;
    return Stack(
      fit: StackFit.expand,
      children: [
        fallback,
        const Positioned(
          right: 6,
          bottom: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color(0xCCFFFFFF),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.cloud_off, size: 14, color: Color(0xFF727980)),
            ),
          ),
        ),
      ],
    );
  }
}
