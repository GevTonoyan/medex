import 'package:get/get.dart';
import 'package:medex/common/models/content_document.dart';

class SaleItemModel {
  static const String _amContentKey = 'am';
  static const String _ruContentKey = 'ru';
  static const String _enContentKey = 'en';
  static const String _titleKey = 'title';
  static const String _descriptionKey = 'description';
  static const String _imageUrlKey = 'imageUrl';
  static const String enableKey = 'enable';

  final ContentDocument _amContent;
  final ContentDocument _ruContent;
  final ContentDocument _enContent;
  final String _imageUrl;
  final bool _enabled;

  SaleItemModel({
    required ContentDocument amContent,
    required ContentDocument ruContent,
    required ContentDocument enContent,
    required String imageUrl,
    bool enabled = true,
  })  : _amContent = amContent,
        _ruContent = ruContent,
        _enContent = enContent,
        _imageUrl = imageUrl,
        _enabled = enabled;

  String get imageUrl => _imageUrl;

  bool get enabled => _enabled;

  factory SaleItemModel.fromJson(Map<String, dynamic> json) {
    return SaleItemModel(
      amContent:
          ContentDocument.fromJson(json[_amContentKey] as Map<String, dynamic>),
      ruContent:
          ContentDocument.fromJson(json[_ruContentKey] as Map<String, dynamic>),
      enContent:
          ContentDocument.fromJson(json[_enContentKey] as Map<String, dynamic>),
      imageUrl: (json[_imageUrlKey] ?? '') as String,
      enabled: (json[enableKey] ?? true) as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _amContentKey: _amContent.toJson(),
      _ruContentKey: _ruContent.toJson(),
      _enContentKey: _enContent.toJson(),
      _imageUrlKey: imageUrl,
      enableKey: enabled,
    };
  }

  String translatedTitle() {
    final locale = Get.locale?.languageCode ?? 'am';
    switch (locale) {
      case 'en':
        return _enContent.title;
      case 'ru':
        return _ruContent.title;
      case 'am':
        return _amContent.title;
      default:
        return _amContent.title;
    }
  }

  String translatedDescription() {
    final locale = Get.locale?.languageCode ?? 'am';
    switch (locale) {
      case 'en':
        return _enContent.description;
      case 'ru':
        return _ruContent.description;
      case 'am':
        return _amContent.description;
      default:
        return _amContent.description;
    }
  }
}
