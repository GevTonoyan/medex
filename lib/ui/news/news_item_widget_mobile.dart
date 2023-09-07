import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/news/news_detail_screen.dart';
import 'package:medex/ui/news/news_item_model.dart';
import 'package:medex/widgets/app_network_image.dart';
import 'package:medex/widgets/clickable_text.dart';

class NewsItemWidgetMobile extends StatelessWidget {
  static const newsWidth = 255.0;
  static const newsHeight = 368.0;

  final NewsItemModel newsModel;

  const NewsItemWidgetMobile({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: newsWidth,
      height: newsHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: AspectRatio(
                aspectRatio: 1.80,
                child: AppNetworkImage(
                  imageUrl: newsModel.imageUrl,
                  height: 141,
                  width: 255,
                ),
              )),
          const SizedBox(height: 16),
          Text(
            newsModel.title,
            style: AppFonts.bodyBold.copyWith(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Text(
              newsModel.description,
              style: AppFonts.body.copyWith(),
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            newsModel.date,
            style: AppFonts.body.copyWith(color: AppColors.appBlack.withOpacity(0.5)),
          ),
          const SizedBox(height: 20),
          ClickableText(
            label: 'read_more'.tr,
            textStyle: AppFonts.bodyBold.copyWith(
              color: AppColors.appWhite,
            ),
            color: AppColors.primary,
            isUnderline: true,
            onPressed: () {
              //Change Tab selection to News
              final HomeViewModel homeViewModel = Get.find();
              homeViewModel.currentPage = AppPages.news;

              Get.dialog(NewsDetailScreen(newsItemModel: newsModel));
            },
          )
        ],
      ),
    );
  }
}
