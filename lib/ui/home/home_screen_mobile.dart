import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/ui/about_us/about_us_screen_mobile.dart';
import 'package:medex/ui/blog/blog_screen.dart';
import 'package:medex/ui/contact_us/contact_us_screen.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/home/app_drawer.dart';
import 'package:medex/ui/main/main_screen_mobile.dart';
import 'package:medex/ui/news/news_screen.dart';
import 'package:medex/ui/sales/sales_screen_mobile.dart';
import 'package:medex/ui/services/services_screen.dart';
import 'package:medex/utils/configuration.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/ui_components/footer_widget/footer_widget_mobile.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreenMobile> {
  final HomeViewModel model = Get.find();

  static final Map<AppPages, Widget> _pagesMapMobile = {
    //todo add consts
    AppPages.main: const MainScreenMobile(),
    AppPages.about: AboutUsScreenMobile(),
    AppPages.services: ServicesScreen(),
    AppPages.sales: SalesScreenMobile(),
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
              BoxShadow(
                color: Color(0x0D000000),
                offset: Offset(0, 5),
                blurRadius: 15,
                spreadRadius: 0,
              ),
            ],
          ),
          child: AppBar(
            iconTheme: IconThemeData(color: AppColors.primary),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.only(right: pageHorizontalPaddingMobile),
                child: InkWell(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: SvgPicture.asset(
                      'assets/medex_logo_${homeViewModel.currentLogoAssetPath}.svg',
                      semanticsLabel: 'Medex',
                      height: 34.0,
                      width: 106.0,
                    ),
                  ),
                  onTap: () {
                    if (homeViewModel.currentPage != AppPages.main) {
                      homeViewModel.currentPage = AppPages.main;
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: Configuration().screenSize.height -
                    kToolbarHeight -
                    footerHeightMobile -
                    contentSeparationPaddingMobile,
              ), //TODO
              child: Obx(() {
                return _pagesMapMobile[model.currentPage] ??
                    const MainScreenMobile();
              }),
            ),
            const SizedBox(height: contentSeparationPaddingMobile),
            const FooterWidgetMobile(),
          ],
        ),
      ),
    );
  }
}
