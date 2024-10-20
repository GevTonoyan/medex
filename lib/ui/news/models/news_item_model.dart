import 'package:get/get.dart';
import 'package:medex/common/models/content_document.dart';

class NewsItemModel {
  static const String _amContentKey = 'am';
  static const String _ruContentKey = 'ru';
  static const String _enContentKey = 'en';
  static const String _titleKey = 'title';
  static const String _descriptionKey = 'description';
  static const String _imageUrlKey = 'imageUrl';
  static const String _dateKey = 'date';

  final ContentDocument _amContent;
  final ContentDocument _ruContent;
  final ContentDocument _enContent;
  final String _imageUrl;
  final String _date;

  NewsItemModel({
    required ContentDocument amContent,
    required ContentDocument ruContent,
    required ContentDocument enContent,
    required String imageUrl,
    required String date,
  })  : _amContent = amContent,
        _ruContent = ruContent,
        _enContent = enContent,
        _date = date,
        _imageUrl = imageUrl;

  String get date => _date;

  String get imageUrl => _imageUrl;

  factory NewsItemModel.fromJson(Map<String, dynamic> json) {
    return NewsItemModel(
      amContent:
          ContentDocument.fromJson(json[_amContentKey] as Map<String, dynamic>),
      ruContent:
          ContentDocument.fromJson(json[_ruContentKey] as Map<String, dynamic>),
      enContent:
          ContentDocument.fromJson(json[_enContentKey] as Map<String, dynamic>),
      date: (json[_dateKey] ?? '') as String,
      imageUrl: (json[_imageUrlKey] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _amContentKey: _amContent.toJson(),
      _ruContentKey: _ruContent.toJson(),
      _enContentKey: _enContent.toJson(),
      _dateKey: date,
      _imageUrlKey: imageUrl,
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
