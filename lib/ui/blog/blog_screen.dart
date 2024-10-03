import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/blog/blog_item_widget_desktop.dart';
import 'package:medex/ui/blog/blog_item_widget_mobile.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogViewModel model = Get.find();

    return Padding(
      padding: EdgeInsets.fromLTRB(
        uiOrientedSwitch(
            pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
        uiOrientedSwitch(pageTopPaddingMobile, pageTopPaddingDesktop),
        uiOrientedSwitch(
            pageHorizontalPaddingMobile, pageHorizontalPaddingDesktop),
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'blog'.tr,
            style:
                uiOrientedSwitch(AppFonts.titleMobile, AppFonts.titleDesktop),
          ),
          SizedBox(height: uiOrientedSwitch(16, 24)),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading || model.blogs.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_blog'.tr),
                  const SizedBox(height: 40),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  uiOrientedSwitch(_BlogsGridMobile(), _BlogsGridDesktop()),
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BlogsGridDesktop extends StatelessWidget {
  const _BlogsGridDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogViewModel model = Get.find();

    return LayoutBuilder(builder: (context, constraints) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getGridViewCrossAxisCount(
            constraints.maxWidth,
            BlogItemWidgetDesktop.blogWidth,
          ),
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: BlogItemWidgetDesktop.blogWidth /
              BlogItemWidgetDesktop.blogHeight,
        ),
        itemCount: model.blogs.length,
        itemBuilder: (_, int index) {
          return BlogItemWidgetDesktop(
              blogItemModel: model.blogs.elementAt(index));
        },
      );
    });
  }
}

class _BlogsGridMobile extends StatelessWidget {
  const _BlogsGridMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BlogViewModel model = Get.find();

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: model.blogs.length,
      itemBuilder: (context, index) {
        final blog = model.blogs.elementAt(index);

        return BlogItemWidgetMobile(
          blogItemModel: blog,
          blogWidth: double.maxFinite,
          blogHeight: 538,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        if (index != model.blogs.length) {
          return const SizedBox(height: 24);
        }
        return SizedBox.shrink();
      },
    );
  }
}
