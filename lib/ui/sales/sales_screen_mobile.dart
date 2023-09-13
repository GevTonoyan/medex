import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/sales/sale_item_widget_mobile.dart';
import 'package:medex/ui/sales/sales_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class SalesScreenMobile extends StatelessWidget {
  const SalesScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SalesViewModel model = Get.find();

    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(
        pageHorizontalPaddingMobile,
        pageTopPaddingMobile,
        pageHorizontalPaddingMobile,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'sales'.tr,
            style: AppFonts.titleMobile,
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/main_picture.png',
            height: 262,
            width: double.maxFinite,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading || model.sales.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_sales'.tr),
                  const SizedBox(height: 12),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  for (final sale in model.sales) ...[
                    SalesItemWidgetMobile(saleItemModel: sale),
                    if (sale != model.sales.last) ...[
                      const SizedBox(height: 16),
                    ]
                  ],
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
