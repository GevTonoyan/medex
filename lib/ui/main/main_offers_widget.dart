import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/admin/admin_screen.dart';
import 'package:medex/widgets/default_button_2.dart';

class MainOffersWidget extends StatefulWidget {
  const MainOffersWidget({Key? key}) : super(key: key);

  @override
  State<MainOffersWidget> createState() => _MainOffersWidgetState();
}

class _MainOffersWidgetState extends State<MainOffersWidget> {
  var selectedIndex = 0;
  var numberOfCircles = 3;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 144,
          width: double.maxFinite,
          child: PageView(
            controller: pageController,
            onPageChanged: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            children: [
              Text(
                'main_title_text'.tr,
                style: AppFonts.title,
                maxLines: 3,
              ),
              Text(
                '22222 long text for the second title   aaaaaaa 2222222222',
                style: AppFonts.title,
                maxLines: 3,
              ),
              Text(
                '3333333 long text for the second title   aaaaaaa  33333333333333',
                style: AppFonts.title,
                maxLines: 3,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        DefaultButton2(
          label: 'main_see_more'.tr,
          onPressed: () {
            // final HomeViewModel viewModel = Get.find();
            // viewModel.changePage(AppPages.sales);
              Get.to(() => AdminScreen());
          },
        ),
        const SizedBox(height: 80),
        Container(
          padding: EdgeInsets.only(left: 8),
          height: 16,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: numberOfCircles,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Container(
                        height: 16,
                        width: 16,
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
                  const SizedBox(width: 12),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
