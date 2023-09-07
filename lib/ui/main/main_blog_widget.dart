import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/blog/blog_item_widget_desktop.dart';
import 'package:medex/ui/blog/blog_item_widget_mobile.dart';
import 'package:medex/ui/blog/blog_view_model.dart';
import 'package:medex/ui/home/app_pages.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/configuration.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/utils/utils.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';
import 'package:medex/widgets/list_scroll_buttons.dart';

const _blogWidgetPadding = 24.0;

class MainBlogWidget extends StatefulWidget {
  const MainBlogWidget({Key? key}) : super(key: key);

  @override
  State<MainBlogWidget> createState() => _MainBlogWidgetState();
}

class _MainBlogWidgetState extends State<MainBlogWidget> {
  final _controller = ScrollController();
  final BlogViewModel model = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: uiOrientedSwitch(16, pageContentLeftPadding)),
      child: Column(
        children: [
          Row(
            children: [
              Text('blog'.tr, style: uiOrientedSwitch(AppFonts.titleMobile, AppFonts.titleDesktop)),
              const SizedBox(width: 24),
              if (Configuration().isDesktop) ...[
                ListScrollButtons(
                  controller: _controller,
                  offset: BlogItemWidgetDesktop.blogWidth - _blogWidgetPadding,
                ),
              ],
              const Spacer(),
              ClickableText(
                label: 'see_all2'.tr,
                textStyle: AppFonts.bodyBold,
                color: AppColors.primary,
                isUnderline: true,
                onPressed: () {
                  final HomeViewModel viewModel = Get.find();
                  viewModel.currentPage = AppPages.blog;
                },
              ),
              SizedBox(width: uiOrientedSwitch(30, 190)),
            ],
          ),
          const SizedBox(height: 24.0),
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.isLoading || model.blogs.isEmpty) ...[
                  Text(model.isLoading ? 'loading'.tr : 'no_blog'.tr),
                  const SizedBox(height: 40),
                  EmptyListLoadingWidget(isLoading: model.isLoading),
                ] else ...[
                  SizedBox(
                    height: uiOrientedSwitch(469.0, 297.0),
                    width: double.maxFinite,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        final blog = model.blogs.elementAt(index);
                        return uiOrientedSwitch(
                          BlogItemWidgetMobile(blogItemModel: blog),
                          BlogItemWidgetDesktop(blogItemModel: blog),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: uiOrientedSwitch(16.0, 24.0)),
                      itemCount: model.blogs.length,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
