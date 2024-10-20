import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/news/models/news_item_model.dart';
import 'package:medex/ui/news/views/news_detail_screen.dart';
import 'package:medex/widgets/ui_components/app_network_image.dart';
import 'package:medex/widgets/ui_components/clickable_text.dart';

class NewsItemWidgetDesktop extends StatelessWidget {
  static const newsWidth = 368.0;
  static const newsHeight = 382.0;

  final NewsItemModel newsModel;

  const NewsItemWidgetDesktop({
    Key? key,
    required this.newsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: newsWidth,
      height: newsHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: AspectRatio(
                          aspectRatio: 1.80,
                          child: AppNetworkImage(
                            imageUrl: newsModel.imageUrl,
                            fit: BoxFit.fitWidth,
                            height: 204,
                            width: 368,
                          ),
                        )),
                    const SizedBox(height: 16),
                    Text(
                      newsModel.translatedTitle(),
                      style: AppFonts.bodyBold.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      newsModel.translatedDescription(),
                      style: AppFonts.body.copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      newsModel.date,
                      style: AppFonts.body
                          .copyWith(color: AppColors.appBlack.withOpacity(0.5)),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
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

              Get.to<void>(NewsDetailScreen(newsItemModel: newsModel));
            },
          )
        ],
      ),
    );
  }
}
