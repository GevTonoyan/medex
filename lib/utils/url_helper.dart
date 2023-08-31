import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> openUrl({required String url}) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      //TODO
      throw Exception('Could not launch $url');
    }
  }
}
