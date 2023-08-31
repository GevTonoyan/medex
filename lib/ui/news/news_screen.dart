import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/news/news_item_model.dart';
import 'package:medex/ui/news/news_item_widget.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/app_loading.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Stream<QuerySnapshot> _newsStream = FirebaseFirestore.instance.collection('news').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _newsStream,
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
                child: const AppLoading(),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'news'.tr,
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
                          crossAxisCount: 4,
                          crossAxisSpacing: 24,
                          mainAxisSpacing: 24,
                          childAspectRatio: 0.96,
                        ),
                        itemCount: docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final newsMap = docs[index].data() as Map<String, dynamic>;
                          final newsItem = NewsItemModel.fromJson(newsMap);
                          return NewsItemWidget(newsModel: newsItem);
                        },
                      )
                    ]
                  ],
                );
              })
            ],
          ),
        );
      },
    );
  }
}
