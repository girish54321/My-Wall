import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:octo_image/octo_image.dart';

class AppNetWorkImage extends StatelessWidget {
  final String imageUrl;
  final String blurHash;
  final int width;
  final int height;

  const AppNetWorkImage({
    Key? key,
    required this.imageUrl,
    required this.blurHash,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: width / height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: OctoImage(
          image: CachedNetworkImageProvider(imageUrl),
          placeholderBuilder: OctoBlurHashFix.placeHolder(
            blurHash,
          ),
          errorBuilder: OctoError.icon(color: Colors.red),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class OctoBlurHashFix {
  static OctoPlaceholderBuilder placeHolder(String hash, {BoxFit? fit}) {
    return (context) => SizedBox.expand(
          child: Image(
            image: BlurHashImage(hash),
            fit: fit ?? BoxFit.cover,
          ),
        );
  }

  static OctoErrorBuilder error(
    String hash, {
    BoxFit? fit,
    Text? message,
    IconData? icon,
    Color? iconColor,
    double? iconSize,
  }) {
    return OctoError.placeholderWithErrorIcon(
      placeHolder(hash, fit: fit),
      message: message,
      icon: icon,
      iconColor: iconColor,
      iconSize: iconSize,
    );
  }
}
