import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/news/news_item_widget.dart';
import 'package:medex/widgets/clickable_text.dart';

class MainNewsWidget extends StatelessWidget {
  const MainNewsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('news'.tr, style: AppFonts.title),
              ClickableText(
                label: 'see_all2'.tr,
                textStyle: AppFonts.bodyBold,
                color: AppColors.primary,
                isUnderline: true,
                onPressed: () {
                  final HomeViewModel viewModel = Get.find();
                  viewModel.changePage(AppPages.blog);
                },
              )
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 400.0,
            width: double.maxFinite,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const NewsItemWidget(),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}