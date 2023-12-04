/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Inter-Bold.ttf
  String get interBold => 'assets/fonts/Inter-Bold.ttf';

  /// File path: assets/fonts/Inter-Medium.ttf
  String get interMedium => 'assets/fonts/Inter-Medium.ttf';

  /// File path: assets/fonts/Inter-Regular.ttf
  String get interRegular => 'assets/fonts/Inter-Regular.ttf';

  /// File path: assets/fonts/Inter-SemiBold.ttf
  String get interSemiBold => 'assets/fonts/Inter-SemiBold.ttf';

  /// File path: assets/fonts/Montserrat-Bold.ttf
  String get montserratBold => 'assets/fonts/Montserrat-Bold.ttf';

  /// File path: assets/fonts/Montserrat-ExtraBold.ttf
  String get montserratExtraBold => 'assets/fonts/Montserrat-ExtraBold.ttf';

  /// File path: assets/fonts/Montserrat-Light.ttf
  String get montserratLight => 'assets/fonts/Montserrat-Light.ttf';

  /// File path: assets/fonts/Montserrat-Medium.ttf
  String get montserratMedium => 'assets/fonts/Montserrat-Medium.ttf';

  /// File path: assets/fonts/Montserrat-Regular.ttf
  String get montserratRegular => 'assets/fonts/Montserrat-Regular.ttf';

  /// File path: assets/fonts/Montserrat-SemiBold.ttf
  String get montserratSemiBold => 'assets/fonts/Montserrat-SemiBold.ttf';

  /// File path: assets/fonts/NotoSerif-Bold.ttf
  String get notoSerifBold => 'assets/fonts/NotoSerif-Bold.ttf';

  /// File path: assets/fonts/NotoSerif-Medium.ttf
  String get notoSerifMedium => 'assets/fonts/NotoSerif-Medium.ttf';

  /// File path: assets/fonts/NotoSerif-Regular.ttf
  String get notoSerifRegular => 'assets/fonts/NotoSerif-Regular.ttf';

  /// File path: assets/fonts/NotoSerif-SemiBold.ttf
  String get notoSerifSemiBold => 'assets/fonts/NotoSerif-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [
        interBold,
        interMedium,
        interRegular,
        interSemiBold,
        montserratBold,
        montserratExtraBold,
        montserratLight,
        montserratMedium,
        montserratRegular,
        montserratSemiBold,
        notoSerifBold,
        notoSerifMedium,
        notoSerifRegular,
        notoSerifSemiBold
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/settings.png
  AssetGenImage get settings =>
      const AssetGenImage('assets/images/settings.png');

  /// File path: assets/images/user.jpeg
  AssetGenImage get userJpeg => const AssetGenImage('assets/images/user.jpeg');

  /// File path: assets/images/user.png
  AssetGenImage get userPng => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/user_round.png
  AssetGenImage get userRound =>
      const AssetGenImage('assets/images/user_round.png');

  /// List of all assets
  List<AssetGenImage> get values => [settings, userJpeg, userPng, userRound];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/add_image.svg
  String get addImage => 'assets/svg/add_image.svg';

  /// File path: assets/svg/fill_document.svg
  String get fillDocument => 'assets/svg/fill_document.svg';

  /// File path: assets/svg/image-gallery.svg
  String get imageGallery => 'assets/svg/image-gallery.svg';

  /// File path: assets/svg/new-document.svg
  String get newDocument => 'assets/svg/new-document.svg';

  /// File path: assets/svg/user.svg
  String get user => 'assets/svg/user.svg';

  /// List of all assets
  List<String> get values =>
      [addImage, fillDocument, imageGallery, newDocument, user];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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
