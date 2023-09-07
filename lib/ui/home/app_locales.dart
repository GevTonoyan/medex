const _serviceArmPath =
    'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/medex_services_arm.pdf?alt=media&token=c7d252c3-e5b2-42ad-b787-8ecd1c26ff63';
const _serviceRusPath =
    'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/medex_services_rus.pdf?alt=media&token=f11303c5-0d99-4a92-b2bb-f837f5f9108c';
const _serviceEngPath =
    'https://firebasestorage.googleapis.com/v0/b/medex-9ae38.appspot.com/o/medex_services_eng.pdf?alt=media&token=8ada13b2-6f14-4892-a500-64d8e0ab9ce4';

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
        return _serviceArmPath;
      case rus:
        return _serviceRusPath;
      case eng:
        return _serviceEngPath;
    }
  }
}
