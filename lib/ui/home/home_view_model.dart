import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppPages {
  main('main'),
  about('about'),
  services('services'),
  sales('sales'),
  blog('blog'),
  news('news'),
  contact('contact');

  final String page;

  const AppPages(this.page);

  @override
  String toString() {
    return page;
  }
}

enum AppLocales {
  arm('հայ'),
  rus('Рус'),
  eng('Eng');

  final String languageName;

  const AppLocales(this.languageName);

  @override
  String toString() {
    return languageName;
  }

  String toLogoAssetPath() {
    switch (this) {
      case arm:
        return 'arm';
      case rus:
        return 'rus';
      case eng:
        return 'eng';
    }
  }
}

class HomeViewModel extends GetxController {
  var currentPage = AppPages.main.obs;

  var currentLocale = AppLocales.arm.obs;

  var currentLogoAssetPath = 'arm'.obs;

  void changePage(AppPages page) {
    currentPage.value = page;
  }

  void changeLocale(AppLocales locale) {
    currentLocale.value = locale;
    currentLogoAssetPath.value = locale.toLogoAssetPath();

    switch (locale) {
      case AppLocales.arm:
        Get.updateLocale(const Locale('hy', 'AM'));
        break;
      case AppLocales.rus:
        Get.updateLocale(const Locale('ru', 'RU'));
        break;
      case AppLocales.eng:
        Get.updateLocale(const Locale('en', 'EN'));
        break;
    }
  }
}
