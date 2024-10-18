import 'package:get/get.dart';
import 'package:medex/ui/admin/admin_view_model.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/main/main_offers_view_model.dart';
import 'package:medex/ui/news/services/news_service.dart';
import 'package:medex/ui/news/view_models/news_view_model.dart';
import 'package:medex/ui/sales/sales_view_model.dart';
import 'package:medex/ui/admin/admin_password_view_model.dart';

void setupDependencies() {
  Get.lazyPut(() => HomeViewModel());
  Get.lazyPut(() => BlogViewModel());

  // news
  Get.lazyPut<NewsService>(() => NewsServiceImpl());
  Get.lazyPut(() => NewsViewModel());

  Get.lazyPut(() => SalesViewModel());
  Get.lazyPut(() => MainOffersViewModel());
  Get.lazyPut(() => AdminViewModel());
  Get.lazyPut(() => AdminPasswordViewModel());
}
