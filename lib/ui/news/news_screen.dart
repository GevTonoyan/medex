import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/news/news_item_widget_desktop.dart';
import 'package:medex/ui/news/news_item_widget_mobile.dart';
import 'package:medex/ui/news/news_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    final NewsViewModel model = Get.find();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        uiOrientedSwitch(pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
        uiOrientedSwitch(pageTopPaddingMobile, pageTopPaddingDesktop),
        uiOrientedSwitch(pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'news'.tr,
            style: uiOrientedSwitch(AppFonts.titleMobile, AppFonts.titleDesktop),
          ),
          SizedBox(height: uiOrientedSwitch(16, 24)),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading || model.news.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_blog'.tr),
                  const SizedBox(height: 40),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  uiOrientedSwitch(_NewsGridMobile(), _NewsGridDesktop()),
                ]
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _NewsGridDesktop extends StatelessWidget {
  const _NewsGridDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsViewModel model = Get.find();

    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getGridViewCrossAxisCount(
            constraints.maxWidth,
            NewsItemWidgetDesktop.newsWidth,
          ),
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: NewsItemWidgetDesktop.newsWidth / NewsItemWidgetDesktop.newsHeight,
        ),
        itemCount: model.news.length,
        itemBuilder: (BuildContext context, int index) {
          return NewsItemWidgetDesktop(newsModel: model.news.elementAt(index));
        },
      );
    });
  }
}

class _NewsGridMobile extends StatelessWidget {
  const _NewsGridMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsViewModel model = Get.find();

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: model.news.length,
      itemBuilder: (context, index) {
        final news = model.news.elementAt(index);

        return NewsItemWidgetMobile(
          newsModel: news,
          newsWidth: double.maxFinite,
          newsHeight: 393,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        if (index != model.news.length) {
          return const SizedBox(height: 24);
        }
        return SizedBox.shrink();
      },
    );
  }
}
