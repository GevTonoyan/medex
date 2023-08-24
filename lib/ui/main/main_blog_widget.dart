import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/blog/blog_item_widget.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/clickable_text.dart';
import 'package:medex/widgets/list_scroll_buttons.dart';

class MainBlogWidget extends StatefulWidget {
  const MainBlogWidget({Key? key}) : super(key: key);

  @override
  State<MainBlogWidget> createState() => _MainBlogWidgetState();
}

class _MainBlogWidgetState extends State<MainBlogWidget> {
  final Stream<QuerySnapshot> _blogsStream = FirebaseFirestore.instance.collection('blogs').snapshots();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _blogsStream,
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
                  children: [
                    Text('blog'.tr, style: AppFonts.title),
                    const SizedBox(width: 24),
                    ListScrollButtons(controller: _controller),
                    const Spacer(),
                    ClickableText(
                      label: 'see_all2'.tr,
                      textStyle: AppFonts.bodyBold,
                      color: AppColors.primary,
                      isUnderline: true,
                      onPressed: () {
                        final HomeViewModel viewModel = Get.find();
                        viewModel.changePage(AppPages.blog);
                      },
                    )
                  ],
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  height: 297.0,
                  width: double.maxFinite,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      final blogMap = docs[index].data() as Map<String, dynamic>;
                      final blogItem = BlogItemModel.fromJson(blogMap);
                      return BlogItemWidget(blogItemModel: blogItem);
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 24.0),
                    itemCount: docs.length,
                  ),
                )
              ],
            ),
          );
        });
  }
}
