import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/utils/constants.dart';
import 'package:medex/ui/admin/views/add_item_widget.dart';
import 'package:medex/ui/admin/views/admin_page_selector_button.dart';
import 'package:medex/ui/admin/views/admin_pages.dart';
import 'package:medex/ui/admin/view_models/admin_view_model.dart';
import 'package:medex/ui/admin/views/sales_list.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final AdminViewModel model = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.disabled,
      body: Column(
        children: [
          Container(
            height: 110,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: contentSeparationPaddingDesktop),
            color: AppColors.appWhite,
            child: SvgPicture.asset(
              'assets/medex_logo_arm.svg',
              semanticsLabel: 'Medex',
              height: 62.0,
              width: 191.0,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: contentSeparationPaddingDesktop,
                  right: contentSeparationPaddingDesktop,
                  bottom: contentSeparationPaddingDesktop,
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 260,
                        decoration: BoxDecoration(
                          color: AppColors.appWhite,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            for (final adminPage in AdminPages.values) ...[
                              AdminPageSelectorButton(page: adminPage),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 160),
                      Obx(() {
                        if (model.selectedPage == AdminPages.addSales &&
                            model.salesPageState == SalesPageState.list) {
                          return Expanded(child: SalesList());
                        } else {
                          return Expanded(child: AddItemWidget());
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
