import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/sales/sales_item_widget.dart';
import 'package:medex/ui/sales/sales_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final model = Get.put(SalesViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(
        pageContentLeftPadding,
        pageContentTopPadding,
        pageContentRightPadding,
        contentSeparationPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'sales'.tr,
            style: AppFonts.titleDesktop,
          ),
          const SizedBox(height: 24),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading || model.sales.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_sales'.tr),
                  const SizedBox(height: 40),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  SizedBox(
                    height: 601.0,
                    width: double.maxFinite,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SalesItemWidget(saleItemModel: model.sales.elementAt(index));
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 24.0),
                      itemCount: model.sales.length,
                    ),
                  )
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
