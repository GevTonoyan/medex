import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/sales/sale_item_model.dart';

class SalesItemWidget extends StatelessWidget {
  final SaleItemModel saleItemModel;

  const SalesItemWidget({
    required this.saleItemModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 601,
      width: 759,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 24),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    saleItemModel.imageUrl,
                    height: 338,
                    width: 474,
                    fit: BoxFit.fill,
                    errorBuilder: (_, __, ___) {
                      return Image.asset(
                        'assets/item_not_found.png',
                        height: 338,
                        width: 474,
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                ),
              ),
              SvgPicture.asset(
                'assets/background_1.svg',
                height: 250,
                width: 255,
                fit: BoxFit.fill,
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    saleItemModel.title,
                    style: AppFonts.subTitle.copyWith(color: AppColors.appWhite),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Text(
                      saleItemModel.description,
                      style: AppFonts.body.copyWith(color: AppColors.appWhite),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
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
