import 'package:get/get.dart';
import 'package:medex/translations/armenian.dart';
import 'package:medex/translations/english.dart';
import 'package:medex/translations/russian.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': englishTranslations,
        'ru-RU': russianTranslations,
        'am-AM': armenianTranslations,
      };
}
