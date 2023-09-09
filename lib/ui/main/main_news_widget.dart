import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/news/news_item_widget_desktop.dart';
import 'package:medex/ui/news/news_item_widget_mobile.dart';
import 'package:medex/ui/news/news_view_model.dart';
import 'package:medex/utils/configuration.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';
import 'package:medex/widgets/list_scroll_buttons.dart';

const _newsWidgetPadding = 24.0;

class MainNewsWidget extends StatefulWidget {
  const MainNewsWidget({Key? key}) : super(key: key);

  @override
  State<MainNewsWidget> createState() => _MainNewsWidgetState();
}

class _MainNewsWidgetState extends State<MainNewsWidget> {
  final _controller = ScrollController();
  final NewsViewModel model = Get.find();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: uiOrientedSwitch(pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop)),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'news'.tr,
                    style: Configuration().isMobile ? AppFonts.titleMobile : AppFonts.titleDesktop,
                  ),
                  const SizedBox(width: 24),
                  if (Configuration().isDesktop) ...[
                    ListScrollButtons(
                      controller: _controller,
                      offset: NewsItemWidgetDesktop.newsWidth - _newsWidgetPadding,
                    ),
                  ],
                ],
              ),
              const Spacer(),
              ClickableText(
                label: 'see_all2'.tr,
                textStyle: AppFonts.bodyBold,
                color: AppColors.primary,
                isUnderline: true,
                onPressed: () {
                  final HomeViewModel viewModel = Get.find();
                  viewModel.currentPage = AppPages.news;
                },
              ),
              SizedBox(width: uiOrientedSwitch(30, pageHorizontalPaddingDesktop))
            ],
          ),
          const SizedBox(height: 24.0),
          Obx(
            () => Column(
              children: [
                if (model.isLoading || model.news.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_blog'.tr),
                  const SizedBox(height: 40),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  SizedBox(
                    height: 385,
                    child: ListView.separated(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        final news = model.news.elementAt(index);

                        return uiOrientedSwitch(
                          NewsItemWidgetMobile(
                            newsModel: news,
                            newsWidth: 255.0,
                            newsHeight: 368.0,
                          ),
                          NewsItemWidgetDesktop(newsModel: news),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: _newsWidgetPadding),
                      itemCount: model.news.length,
                    ),
                  )
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}
