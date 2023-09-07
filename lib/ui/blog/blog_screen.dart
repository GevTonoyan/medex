import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/blog/blog_item_widget_desktop.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class BlogScreen extends StatelessWidget {
  BlogScreen({Key? key}) : super(key: key);

  final BlogViewModel model = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        pageContentLeftPadding,
        pageContentTopPadding,
        pageContentRightPadding,
        contentSeparationPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'blog'.tr,
            style: AppFonts.titleDesktop,
          ),
          const SizedBox(height: 24),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading || model.blogs.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_blog'.tr),
                  const SizedBox(height: 40),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  LayoutBuilder(builder: (context, constraints) {
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
                        childAspectRatio: BlogItemWidgetDesktop.blogWidth / BlogItemWidgetDesktop.blogHeight,
                      ),
                      itemCount: model.blogs.length,
                      itemBuilder: (_, int index) {
                        return BlogItemWidgetDesktop(blogItemModel: model.blogs.elementAt(index));
                      },
                    );
                  }),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
