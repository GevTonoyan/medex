import 'package:get/get.dart';
import 'package:medex/ui/admin/services/admin_service.dart';
import 'package:medex/ui/admin/view_models/admin_view_model.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/main/services/main_service.dart';
import 'package:medex/ui/main/view_models/main_offers_view_model.dart';
import 'package:medex/ui/news/services/news_service.dart';
import 'package:medex/ui/news/view_models/news_view_model.dart';
import 'package:medex/ui/sales/services/sales_service.dart';
import 'package:medex/ui/sales/view_models/sales_view_model.dart';
import 'package:medex/ui/admin/view_models/admin_password_view_model.dart';

void setupDependencies() {
  Get.lazyPut(() => HomeViewModel());
  Get.lazyPut(() => BlogViewModel());

  // main
  Get.lazyPut<MainService>(() => MainServiceImpl());
  Get.lazyPut<MainOffersViewModel>(
    () => MainOffersViewModel(mainService: Get.find()),
  );

  // news
  Get.lazyPut<NewsService>(() => NewsServiceImpl());
  Get.lazyPut(() => NewsViewModel(newsService: Get.find()));

  // sales
  Get.lazyPut(() => SalesViewModel(salesService: Get.find()));
  Get.lazyPut<SalesService>(() => SalesServiceImpl());

  // admin
  Get.lazyPut<AdminService>(() => AdminServiceImpl(), fenix: true);
  Get.lazyPut<AdminViewModel>(() => AdminViewModel());
  Get.lazyPut(
    () => AdminPasswordViewModel(adminService: Get.find()),
    fenix: true,
  );
}
