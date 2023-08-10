import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/blog/blog_item_widget.dart';
import 'package:medex/utils/constants.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        pageContentLeftPadding,
        pageContentTopPadding,
        pageContentRightPadding,
        contentSeparationPadding,
      ),
      child: SizedBox(
        //height: 1200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'blog'.tr,
              style: AppFonts.title,
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 2.3,
              ),
              itemCount: 26,
              itemBuilder: (BuildContext context, int index) {
                return const BlogItemWidget(); // Replace this with your actual widget
              },
            )
          ],
        ),
      ),
    );
  }
}
