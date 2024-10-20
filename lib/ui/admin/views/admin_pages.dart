import 'package:get/get.dart';

enum AdminPages {
  addNews,
  //addBlog,
  addSales;

  String get addText {
    switch (this) {
      case addNews:
        return 'add_news'.tr;
      // case addBlog:
      //   return 'add_blog'.tr;
      case addSales:
        return 'add_sale'.tr;
    }
  }
}
