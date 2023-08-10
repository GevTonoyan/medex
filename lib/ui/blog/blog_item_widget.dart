import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/colors.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/widgets/clickable_text.dart';

const _blotItemAssetPath = 'assets/blog_item.png';

class BlogItemWidget extends StatelessWidget {
  const BlogItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 759.0,
      height: 297.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primary,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  _blotItemAssetPath,
                  fit: BoxFit.fitHeight,
                  height: double.maxFinite,
                )),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ի՞նչ ՉՊԵՏՔ է անել արյան անալիզ հանձելուց առաջ',
                    style: AppFonts.bodyBold.copyWith(
                      color: AppColors.appWhite,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      'Լաբորատորիայում արյան նմուշ հանձնելուց առաջ չի կարելի ընդունել շաքար պարունակող ըմպելիքներ:Խորհուրդ չի տրվում անալիզի հանձնման նախորդ օրերին օգտագործել յուղոտ սնունդ պարունակող ըմպելիքներ:Խորհուրդ չի տրվում անալիզի',
                      style: AppFonts.body.copyWith(
                        color: AppColors.appWhite,
                      ),
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ClickableText(
                    label: 'read_more'.tr,
                    textStyle: AppFonts.bodyBold.copyWith(
                      color: AppColors.appWhite,
                    ),
                    color: AppColors.appWhite,
                    isUnderline: true,
                    onPressed: () {
                      final HomeViewModel homeViewModel = Get.find();
                      homeViewModel.changePage(AppPages.blog);
                    },
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
