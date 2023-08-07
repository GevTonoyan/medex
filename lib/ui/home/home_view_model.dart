import 'package:get/get.dart';

enum AppPages {
  main('main'),
  about('about_us'),
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

class HomeViewModel extends GetxController {
  var currentPage = AppPages.main.obs;

  void changePage(AppPages page) {
    currentPage.value = page;
  }
}
