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

  /// File path: assets/images/png/profile_placeholder_male.png
  AssetGenImage get profilePlaceholderMale =>
      const AssetGenImage('assets/images/png/profile_placeholder_male.png');

  /// File path: assets/images/png/time_exceeded.png
  AssetGenImage get timeExceeded =>
      const AssetGenImage('assets/images/png/time_exceeded.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        nuforceSplash,
        onboarding1,
        onboarding2,
        onboarding3,
        phoneText,
        profilePlaceholderMale,
        timeExceeded
      ];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/activity0.svg
  String get activity0 => 'assets/images/svg/activity0.svg';

  /// File path: assets/images/svg/activity1.svg
  String get activity1 => 'assets/images/svg/activity1.svg';

  /// File path: assets/images/svg/apple.svg
  String get apple => 'assets/images/svg/apple.svg';

  /// File path: assets/images/svg/facebook.svg
  String get facebook => 'assets/images/svg/facebook.svg';

  /// File path: assets/images/svg/google.svg
  String get google => 'assets/images/svg/google.svg';

  /// File path: assets/images/svg/home0.svg
  String get home0 => 'assets/images/svg/home0.svg';

  /// File path: assets/images/svg/home1.svg
  String get home1 => 'assets/images/svg/home1.svg';

  /// File path: assets/images/svg/microsoft.svg
  String get microsoft => 'assets/images/svg/microsoft.svg';

  /// File path: assets/images/svg/more0.svg
  String get more0 => 'assets/images/svg/more0.svg';

  /// File path: assets/images/svg/more1.svg
  String get more1 => 'assets/images/svg/more1.svg';

  /// File path: assets/images/svg/notification.svg
  String get notification => 'assets/images/svg/notification.svg';

  /// File path: assets/images/svg/nuforce_logo.svg
  String get nuforceLogo => 'assets/images/svg/nuforce_logo.svg';

  /// File path: assets/images/svg/pin_location.svg
  String get pinLocation => 'assets/images/svg/pin_location.svg';

  /// File path: assets/images/svg/scan.svg
  String get scan => 'assets/images/svg/scan.svg';

  /// File path: assets/images/svg/success.svg
  String get success => 'assets/images/svg/success.svg';

  /// File path: assets/images/svg/today0.svg
  String get today0 => 'assets/images/svg/today0.svg';

  /// File path: assets/images/svg/today1.svg
  String get today1 => 'assets/images/svg/today1.svg';

  /// List of all assets
  List<String> get values => [
        activity0,
        activity1,
        apple,
        facebook,
        google,
        home0,
        home1,
        microsoft,
        more0,
        more1,
        notification,
        nuforceLogo,
        pinLocation,
        scan,
        success,
        today0,
        today1
      ];
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
