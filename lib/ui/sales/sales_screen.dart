import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/sales/sale_item_model.dart';
import 'package:medex/ui/sales/sales_item_widget.dart';
import 'package:medex/utils/constants.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final Stream<QuerySnapshot> _salesStream = FirebaseFirestore.instance.collection('sales').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _salesStream,
      builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
        return Container(
          width: double.maxFinite,
          padding: EdgeInsets.fromLTRB(
            pageContentLeftPadding,
            pageContentTopPadding,
            pageContentRightPadding,
            contentSeparationPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sales'.tr,
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
                      Text(isWaiting ? 'loading'.tr : 'no_sales'.tr),
                      const SizedBox(height: 40),
                      EmptyListLoadingWidget(isLoading: isWaiting),
                    ] else ...[
                      SizedBox(
                        height: 601.0,
                        width: double.maxFinite,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final docs = snapshot.data!.docs;
                            final saleItemMap = docs[index].data() as Map<String, dynamic>;
                            final saleItem = SaleItemModel.fromJson(saleItemMap);
                            return SalesItemWidget(saleItemModel: saleItem);
                          },
                          separatorBuilder: (context, index) => const SizedBox(width: 24.0),
                          itemCount: snapshot.data!.docs.length,
                        ),
                      )
                    ]
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }
}
