import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/blog/blog_item_widget.dart';
import 'package:medex/utils/constants.dart';

class BlogScreen extends StatelessWidget {
  final Stream<QuerySnapshot> _blogsStream = FirebaseFirestore.instance.collection('blogs').snapshots();

  BlogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _blogsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text(
            'Something went wrong',
            style: AppFonts.title,
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            "Loading",
            style: AppFonts.title,
          );
        }

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
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final blog = snapshot.data!.docs[index];
                    final map = blog.data() as Map<String, dynamic>;
                    return  BlogItemWidget(
                      map: map,
                    ); // Replace this with your actual widget
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
