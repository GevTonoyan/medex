import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/widgets/clickable_text.dart';

const _newsItemAssetPath = 'news_item.png';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 368.0,
      height: 434.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: AspectRatio(
                aspectRatio: 1.80,
                child: Image.asset(
                  _newsItemAssetPath,
                  fit: BoxFit.fill,
                  // height: 204.0,
                  width: double.maxFinite,
                ),
              )),
          const SizedBox(height: 16),
          Text(
            'Լօռեմ իպսում',
            style: AppFonts.bodyBold.copyWith(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Text(
            'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաք․․․',
            style: AppFonts.body.copyWith(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          Text(
            '20.06.2023',
            style: AppFonts.body.copyWith(color: AppColors.appBlack.withOpacity(0.5)),
          ),
          const SizedBox(height: 20),
          ClickableText(
            label: 'read_more'.tr,
            textStyle: AppFonts.bodyBold.copyWith(
              color: AppColors.appWhite,
            ),
            color: AppColors.primary,
            isUnderline: true,
            onPressed: () {
              final HomeViewModel homeViewModel = Get.find();
              homeViewModel.changePage(AppPages.news);
            },
          )
        ],
      ),
    );
  }
}
