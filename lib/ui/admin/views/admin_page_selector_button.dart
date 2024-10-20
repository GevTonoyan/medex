import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/ui/admin/views/admin_pages.dart';
import 'package:medex/ui/admin/view_models/admin_view_model.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';

class AdminPageSelectorButton extends StatelessWidget {
  final AdminPages page;

  const AdminPageSelectorButton({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AdminViewModel viewModel = Get.find();

    return Obx(
      () => Container(
        height: 72,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: page == viewModel.selectedPage ? AppColors.mintGreen : AppColors.appWhite,
        ),
        padding: EdgeInsets.only(left: 40),
        child: ClickableText(
          label: '+  ${page.addText}',
          textStyle: AppFonts.bodyBold,
          onPressed: () {
            if (page == AdminPages.addSales) {
              viewModel.salesPageState = SalesPageState.list;
            }
            viewModel.selectedPage = page;
          },
        ),
      ),
    );
  }
}
