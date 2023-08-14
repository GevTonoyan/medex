import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/news/news_item_widget.dart';
import 'package:medex/utils/constants.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

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
            'news'.tr,
            style: AppFonts.title,
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.92,
            ),
            itemCount: 26,
            itemBuilder: (BuildContext context, int index) {
              return const NewsItemWidget(); // Replace this with your actual widget
            },
          )
        ],
      ),
    );
  }
}
