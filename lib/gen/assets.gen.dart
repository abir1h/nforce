/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/nuforce_splash.png
  AssetGenImage get nuforceSplash =>
      const AssetGenImage('assets/images/png/nuforce_splash.png');

  /// File path: assets/images/png/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/png/onboarding1.png');

  /// File path: assets/images/png/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/png/onboarding2.png');

  /// File path: assets/images/png/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/png/onboarding3.png');

  /// File path: assets/images/png/phone_text.png
  AssetGenImage get phoneText =>
      const AssetGenImage('assets/images/png/phone_text.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [nuforceSplash, onboarding1, onboarding2, onboarding3, phoneText];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/apple.svg
  String get apple => 'assets/images/svg/apple.svg';

  /// File path: assets/images/svg/facebook.svg
  String get facebook => 'assets/images/svg/facebook.svg';

  /// File path: assets/images/svg/google.svg
  String get google => 'assets/images/svg/google.svg';

  /// File path: assets/images/svg/microsoft.svg
  String get microsoft => 'assets/images/svg/microsoft.svg';

  /// File path: assets/images/svg/nuforce_logo.svg
  String get nuforceLogo => 'assets/images/svg/nuforce_logo.svg';

  /// List of all assets
  List<String> get values => [apple, facebook, google, microsoft, nuforceLogo];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
