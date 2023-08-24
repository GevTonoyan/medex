import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/blog/blog_item_widget.dart';
import 'package:medex/ui/blog/blog_item_model.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class BlogScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _blogsStream = FirebaseFirestore.instance.collection('blogs').snapshots();

  BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _blogsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: SizedBox(
              height: 277,
              width: 371,
              child: Image.asset('assets/empty_list_background.png'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Stack(children: [
              SizedBox(
                height: 277,
                width: 371,
                child: Image.asset('assets/empty_list_background.png'),
              ),
              //In Waiting State we need to show loading indicator
              Positioned(
                left: 135,
                top: 76,
                child: SizedBox(
                    height: 81,
                    width: 81,
                    child: SpinKitCircle(
                      color: AppColors.primary,
                      size: 81.0,
                    )),
              )
            ]),
          );
        }

        final docs = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.fromLTRB(
            pageContentLeftPadding,
            pageContentTopPadding,
            pageContentRightPadding,
            contentSeparationPadding,
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'blog'.tr,
                  style: AppFonts.title,
                ),
                const SizedBox(height: 24),
                Builder(builder: (_) {
                  final isWaiting = snapshot.connectionState == ConnectionState.waiting;
                  final snapshotErrorWaitingEmptyState = snapshot.hasError || isWaiting || (snapshot.data?.docs.isEmpty ?? true);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (snapshotErrorWaitingEmptyState) ...[
                        Text(isWaiting ? 'loading'.tr : 'no_blog'.tr),
                        const SizedBox(height: 40),
                        EmptyListLoadingWidget(isLoading: isWaiting),
                      ] else ...[
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                            childAspectRatio: 2.3,
                          ),
                          itemCount: docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            final blogMap = docs[index].data() as Map<String, dynamic>;
                            final blogItem = BlogItemModel.fromJson(blogMap);
                            return BlogItemWidget(blogItemModel: blogItem);
                          },
                        ),
                      ],
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
