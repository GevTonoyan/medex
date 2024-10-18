import 'package:flutter/material.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/ui/sales/sale_item_model.dart';

class SalesItemWidgetMobile extends StatelessWidget {
  final SaleItemModel saleItemModel;

  const SalesItemWidgetMobile({
    required this.saleItemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          saleItemModel.title,
          style: AppFonts.body.copyWith(color: AppColors.primary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          saleItemModel.description,
          style: AppFonts.body,
        ),
      ],
    );
  }
}
