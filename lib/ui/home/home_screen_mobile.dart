import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/ui/about_us/about_us_screen.dart';
import 'package:medex/ui/blog/blog_screen.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/ui/contact_us/contact_us_screen.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/home/app_drawer.dart';
import 'package:medex/ui/main/main_screen_mobile.dart';
import 'package:medex/ui/news/news_screen.dart';
import 'package:medex/ui/news/news_view_model.dart';
import 'package:medex/ui/sales/sales_screen.dart';
import 'package:medex/ui/services/services_screen.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreenMobile> {
  final viewModel = Get.put(HomeViewModel());
  var a = Get.put(BlogViewModel());
  var aa = Get.put(NewsViewModel());

  static final Map<AppPages, Widget> _pagesMapMobile = {
    //todo add consts
    AppPages.main: const MainScreenMobile(),
    AppPages.about: AboutUsScreen(),
    AppPages.services: ServicesScreen(),
    AppPages.sales: SalesScreen(),
    AppPages.blog: BlogScreen(),
    AppPages.news: NewsScreen(),
    AppPages.contact: ContactUsScreen(),
  };

  final HomeViewModel homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.appWhite,
            boxShadow: [
              BoxShadow(blurRadius: 15),
            ],
          ),
          child: AppBar(
            iconTheme: IconThemeData(color: AppColors.primary),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SvgPicture.asset(
                  'assets/medex_logo_${homeViewModel.currentLogoAssetPath}.svg',
                  semanticsLabel: 'Medex',
                  height: 34.0,
                  width: 106.0,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return _pagesMapMobile[viewModel.currentPage] ?? const MainScreenMobile();
        }),
      ),
    );
  }
}
