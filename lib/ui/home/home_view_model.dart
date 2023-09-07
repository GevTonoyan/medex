import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/ui/home/app_locales.dart';
import 'package:medex/ui/home/app_pages.dart';

class HomeViewModel extends GetxController {
  final _currentPage = AppPages.main.obs;

  AppPages get currentPage => _currentPage.value;

  set currentPage(AppPages page) {
    _currentPage.value = page;
  }

  final _currentLocale = AppLocales.arm.obs;

  AppLocales get currentLocale => _currentLocale.value;

  final _currentLogoAssetPath = 'arm'.obs;

  String get currentLogoAssetPath => _currentLogoAssetPath.value;

  void changeLocale(AppLocales locale) {
    _currentLocale.value = locale;
    _currentLogoAssetPath.value = locale.toLogoAssetPath();

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
