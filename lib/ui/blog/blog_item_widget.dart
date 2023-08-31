import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/blog/blog_detail_screen.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/widgets/app_network_image.dart';
import 'package:medex/widgets/clickable_text.dart';

class BlogItemWidget extends StatelessWidget {
  final BlogItemModel blogItemModel;
  final VoidCallback? onPressed;

  const BlogItemWidget({
    Key? key,
    required this.blogItemModel,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 759.0,
      height: 297.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              child: AppNetworkImage(
                imageUrl: blogItemModel.imageUrl,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blogItemModel.title,
                    style: AppFonts.bodyBold.copyWith(
                      color: AppColors.appWhite,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      blogItemModel.description,
                      style: AppFonts.body.copyWith(
                        color: AppColors.appWhite,
                      ),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClickableText(
                    label: 'read_more'.tr,
                    textStyle: AppFonts.bodyBold.copyWith(
                      color: AppColors.appWhite,
                    ),
                    color: AppColors.appWhite,
                    isUnderline: true,
                    onPressed: () {
                      //Change Tab selection to Blog
                      final HomeViewModel homeViewModel = Get.find();
                      homeViewModel.changePage(AppPages.blog);

                      Get.dialog(
                        BlogDetailScreen(blog: blogItemModel),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
