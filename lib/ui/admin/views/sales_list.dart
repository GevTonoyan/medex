import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_colors.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/ui/admin/views/admin_pages.dart';
import 'package:medex/ui/admin/view_models/admin_view_model.dart';
import 'package:medex/ui/sales/models/sale_item_model.dart';
import 'package:medex/widgets/ui_components/app_icon.dart';
import 'package:medex/widgets/ui_components/default_button_1.dart';
import 'package:medex/widgets/empty_list_loading_widget.dart';

class SalesList extends StatefulWidget {
  const SalesList({Key? key}) : super(key: key);

  @override
  State<SalesList> createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  final AdminViewModel model = Get.find();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: model.getSalesStream(),
        builder: (_, AsyncSnapshot<QuerySnapshot> snapshot) {
          final isWaiting = snapshot.connectionState == ConnectionState.waiting;
          final snapshotErrorWaitingEmptyState = snapshot.hasError ||
              isWaiting ||
              (snapshot.data?.docs.isEmpty ?? true);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sales'.tr,
                style: AppFonts.titleDesktop,
              ),
              const SizedBox(height: 40),
              Builder(builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (snapshotErrorWaitingEmptyState) ...[
                      Text(isWaiting ? 'loading'.tr : 'no_sales'.tr),
                      const SizedBox(height: 40),
                      EmptyListLoadingWidget(isLoading: isWaiting)
                    ] else ...[
                      SizedBox(
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final docs = snapshot.data!.docs;
                            final saleItemMap =
                                docs[index].data() as Map<String, dynamic>;
                            final saleItem =
                                SaleItemModel.fromJson(saleItemMap);
                            return _SaleItemWidget(
                              saleItemModel: saleItem,
                              id: docs[index].id,
                              index: index,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 24.0),
                          itemCount: snapshot.data!.docs.length,
                        ),
                      ),
                    ]
                  ],
                );
              }),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerRight,
                child: DefaultButton1(
                    label: '+ ${AdminPages.addSales.addText}',
                    onPressed: () {
                      final AdminViewModel viewModel = Get.find();
                      viewModel.salesPageState = SalesPageState.add;
                    }),
              ),
            ],
          );
        });
  }
}

class _SaleItemWidget extends StatelessWidget {
  final SaleItemModel saleItemModel;
  final String id;
  final int index;

  const _SaleItemWidget({
    Key? key,
    required this.saleItemModel,
    required this.id,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.appWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(index.toString(), style: AppFonts.subTitleDesktop),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              saleItemModel.translatedTitle(),
              style: AppFonts.body,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 40),
          Text(saleItemModel.enabled ? 'on'.tr : 'off'.tr,
              style: AppFonts.body),
          Switch(
            value: saleItemModel.enabled,
            activeColor: AppColors.appWhite,
            inactiveThumbColor: AppColors.appWhite,
            activeTrackColor: AppColors.primary,
            inactiveTrackColor: AppColors.disabled,
            onChanged: (bool value) {
              final documentReference =
                  FirebaseFirestore.instance.collection('sales').doc(id);
              documentReference.update({
                SaleItemModel.enableKey: value,
              });
            },
          ),
          const SizedBox(width: 16),
          Text(
            'delete'.tr,
            style: AppFonts.body,
          ),
          const SizedBox(width: 6),
          AppIcon(
            assetPath: 'assets/delete_icon.svg',
            iconColor: AppColors.primary,
            onPressed: () {
              final AdminViewModel viewModel = Get.find();
              viewModel.deleteSale(id);
            },
          ),
        ],
      ),
    );
  }
}
