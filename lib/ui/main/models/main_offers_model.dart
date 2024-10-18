import 'package:get/get.dart';

class MainOffersModel {
  final String en;
  final String ru;
  final String am;

  MainOffersModel({
    required this.en,
    required this.ru,
    required this.am,
  });

  // fromJson factory method to parse Firestore document data
  factory MainOffersModel.fromJson(Map<String, dynamic> json) {
    return MainOffersModel(
      en: json['en'] as String,
      ru: json['ru'] as String,
      am: json['am'] as String,
    );
  }

  String translatedTitle() {
    final locale = Get.locale?.languageCode ?? 'arm';
    switch (locale) {
      case 'en':
        return en;
      case 'ru':
        return ru;
      case 'am':
        return am;
      default:
        return am;
    }
  }
}
