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

enum FooterIcons {
  instagram,
  facebook,
  telegram,
  viber,
  whatsApp;

  String assetPath() {
    switch (this) {
      case FooterIcons.instagram:
        return 'assets/instagram_icon.svg';
      case FooterIcons.facebook:
        return 'assets/facebook_icon.svg';
      case FooterIcons.telegram:
        return 'assets/telegram_icon.svg';
      case FooterIcons.viber:
        return 'assets/viber_icon.svg';
      case FooterIcons.whatsApp:
        return 'assets/whats_app_icon.svg';
    }
  }

  String urlPath() {
    switch (this) {
      case FooterIcons.instagram:
        return 'https://www.facebook.com/medex.lab.clinic';
      case FooterIcons.facebook:
        return 'https://www.instagram.com/medex.clinic';
      case FooterIcons.telegram:
        return 'https://t.me/medex_clinic';
      case FooterIcons.viber:
        return 'viber://add?number=37496203301';
      case FooterIcons.whatsApp:
        return 'https://wa.me/message/L3K4FNOF2F4GH1';
    }
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

  String servicesUrlPath() {
    switch (this) {
      case arm:
        return 'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/medex_services_arm.pdf?alt=media&token=c7d252c3-e5b2-42ad-b787-8ecd1c26ff63';
      case rus:
        return 'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/medex_services_rus.pdf?alt=media&token=f11303c5-0d99-4a92-b2bb-f837f5f9108c';
      case eng:
        return 'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/medex_services_eng.pdf?alt=media&token=8ada13b2-6f14-4892-a500-64d8e0ab9ce4';
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
