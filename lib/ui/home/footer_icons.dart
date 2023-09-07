//Icons asset paths
const _instagramAssetPath = 'assets/instagram_icon.svg';
const _facebookAssetPath = 'assets/facebook_icon.svg';
const _telegramAssetPath = 'assets/telegram_icon.svg';
const _viberAssetPath = 'assets/viber_icon.svg';
const _whatsAppAssetPath = 'assets/whats_app_icon.svg';

//Urls paths
const _instagramUrlPath = 'https://www.instagram.com/medex.clinic';
const _facebookUrlPath = 'https://www.facebook.com/medex.lab.clinic';
const _telegramUrlPath = 'https://t.me/medex_clinic';
const _viberUrlPath = 'viber://add?number=37496203301';
const _whatsAppUrlPath = 'https://wa.me/message/L3K4FNOF2F4GH1';

enum FooterIcons {
  instagram,
  facebook,
  telegram,
  viber,
  whatsApp;

  String assetPath() {
    switch (this) {
      case FooterIcons.instagram:
        return _instagramAssetPath;
      case FooterIcons.facebook:
        return _facebookAssetPath;
      case FooterIcons.telegram:
        return _telegramAssetPath;
      case FooterIcons.viber:
        return _viberAssetPath;
      case FooterIcons.whatsApp:
        return _whatsAppAssetPath;
    }
  }

  String urlPath() {
    switch (this) {
      case FooterIcons.instagram:
        return _instagramUrlPath;
      case FooterIcons.facebook:
        return _facebookUrlPath;
      case FooterIcons.telegram:
        return _telegramUrlPath;
      case FooterIcons.viber:
        return _viberUrlPath;
      case FooterIcons.whatsApp:
        return _whatsAppUrlPath;
    }
  }
}
