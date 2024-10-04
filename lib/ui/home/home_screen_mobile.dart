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
  final ScrollController scrollController = ScrollController();

  static final Map<AppPages, Widget> _pagesMapMobile = {
    AppPages.main: const MainScreenMobile(),
    AppPages.about: const AboutUsScreenMobile(),
    AppPages.services: const ServicesScreen(),
    AppPages.sales: const SalesScreenMobile(),
    AppPages.blog: const BlogScreen(),
    AppPages.news: const NewsScreen(),
    AppPages.contact: const ContactUsScreen(),
  };

  final HomeViewModel homeViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appWhite,
      drawer: const AppDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
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
            backgroundColor: AppColors.appWhite,
            scrolledUnderElevation: 0,
            elevation: 0,
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
        controller: scrollController,
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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollController.jumpTo(0);
                });
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
