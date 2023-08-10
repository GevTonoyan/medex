import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/utils/constants.dart';

const _newsDetailAssetPath = 'assets/news_item.png';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(pageContentLeftPadding, pageContentTopPadding, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'news'.tr,
            style: AppFonts.title,
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Նոր աշխատատեղեր',
                      style: AppFonts.subTitle,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը:',
                      style: AppFonts.body,
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 404,
                      width: 750,
                      child: Image.asset(
                        _newsDetailAssetPath,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 24),
              SizedBox(
                height: 827.0,
                width: 817.0,
                child: SvgPicture.asset(
                  'assets/background_2.svg',
                  semanticsLabel: 'Medex',
                ),
              ),
            ],
          ),
          const SizedBox(height: contentSeparationPadding),
        ],
      ),
    );
  }
}
