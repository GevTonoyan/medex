import 'package:get/get.dart';
import 'package:medex/ui/admin/admin_view_model.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/main/main_offers_view_model.dart';
import 'package:medex/ui/news/services/news_service.dart';
import 'package:medex/ui/news/view_models/news_view_model.dart';
import 'package:medex/ui/sales/services/sales_service.dart';
import 'package:medex/ui/sales/view_models/sales_view_model.dart';
import 'package:medex/ui/admin/admin_password_view_model.dart';

void setupDependencies() {
  Get.lazyPut(() => HomeViewModel());
  Get.lazyPut(() => BlogViewModel());
  Get.lazyPut(() => MainOffersViewModel());

  // news
  Get.lazyPut<NewsService>(() => NewsServiceImpl());
  Get.lazyPut(() => NewsViewModel(newsService: Get.find()));

  // sales
  Get.lazyPut(() => SalesViewModel(salesService: Get.find()));
  Get.lazyPut<SalesService>(() => SalesServiceImpl());

  // admin
  Get.lazyPut(() => AdminViewModel());
  Get.lazyPut(() => AdminPasswordViewModel());
}
