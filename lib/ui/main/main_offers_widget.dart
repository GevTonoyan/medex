import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/main/main_offers_view_model.dart';
import 'package:medex/utils/configuration.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/ui_components/default_button_2.dart';

///Main offers widget(from Server) used both for desktop and mobile
class MainOffersWidget extends StatefulWidget {
  const MainOffersWidget({Key? key}) : super(key: key);

  @override
  State<MainOffersWidget> createState() => _MainOffersWidgetState();
}

class _MainOffersWidgetState extends State<MainOffersWidget> {
  final MainOffersViewModel offersModel = Get.find();
  var selectedIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          //TODO make page view with expanded sizes
          height: uiOrientedSwitch(110, 144),
          width: double.maxFinite,
          child: PageView(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              for (final offer in offersModel.offers) ...[
                Text(
                  offer.tr,
                  style: Configuration().isMobile ? AppFonts.titleMobile : AppFonts.titleDesktop,
                  maxLines: 3,
                ),
              ],
            ],
          ),
        ),
        SizedBox(height: uiOrientedSwitch(30, 24)),
        DefaultButton2(
          label: 'main_see_more'.tr,
          size: Size(uiOrientedSwitch(double.maxFinite, 187), 52),
          onPressed: () {},
        ),
        SizedBox(height: uiOrientedSwitch(30, 80)),
        Container(
          padding: EdgeInsets.only(left: 8),
          height: uiOrientedSwitch(10, 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: offersModel.offers.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Container(
                        height: uiOrientedSwitch(10, 16),
                        width: uiOrientedSwitch(10, 16),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.primary),
                          color: selectedIndex == index ? AppColors.primary : AppColors.primary.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      onTap: () {
                        pageController.animateToPage(
                          index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: uiOrientedSwitch(6, 10)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
