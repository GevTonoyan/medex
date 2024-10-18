import 'package:get/get.dart';
import 'package:medex/core/translations/armenian.dart';
import 'package:medex/core/translations/english.dart';
import 'package:medex/core/translations/russian.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': englishTranslations,
        'ru_RU': russianTranslations,
        'hy_AM': armenianTranslations,
      };
}
