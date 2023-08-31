import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_colors.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/ui/news/news_item_model.dart';
import 'package:medex/ui/news/news_item_widget.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/list_scroll_buttons.dart';

class MainNewsWidget extends StatefulWidget {
  const MainNewsWidget({Key? key}) : super(key: key);

  @override
  State<MainNewsWidget> createState() => _MainNewsWidgetState();
}

class _MainNewsWidgetState extends State<MainNewsWidget> {
  final Stream<QuerySnapshot> _newsStream = FirebaseFirestore.instance.collection('news').snapshots();
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _newsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Something went wrong',
              style: AppFonts.title,
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: AppColors.primary,
            );
          }

          final docs = snapshot.data!.docs;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: pageContentLeftPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('news'.tr, style: AppFonts.title),
                        const SizedBox(width: 24),
                        ListScrollButtons(controller: _controller),
                      ],
                    ),
                    ClickableText(
                      label: 'see_all2'.tr,
                      textStyle: AppFonts.bodyBold,
                      color: AppColors.primary,
                      isUnderline: true,
                      onPressed: () {
                        final HomeViewModel viewModel = Get.find();
                        viewModel.changePage(AppPages.news);
                      },
                    )
                  ],
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  height: 385,
                  child: ListView.separated(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final newsMap = docs[index].data() as Map<String, dynamic>;
                      final newsItem = NewsItemModel.fromJson(newsMap);
                      return NewsItemWidget(newsModel: newsItem);
                    },
                    separatorBuilder: (_, __) => const SizedBox(width: 24.0),
                    itemCount: docs.length,
                  ),
                )
              ],
            ),
          );
        });
  }
}
