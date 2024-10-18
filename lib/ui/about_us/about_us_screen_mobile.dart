import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/core/utils/constants.dart';
import 'package:medex/ui/main/main_about_widget.dart';
import 'package:medex/widgets/contact_info_widget.dart';

class AboutUsScreenMobile extends StatelessWidget {
  const AboutUsScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        pageHorizontalPaddingMobile,
        pageTopPaddingMobile,
        pageHorizontalPaddingMobile,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('about'.tr, style: AppFonts.titleMobile),
          const SizedBox(height: 16),
          Text('established'.tr, style: AppFonts.subTitleMobile),
          const SizedBox(height: 12),
          const Text(
            'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը:',
            style: AppFonts.body,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.maxFinite,
            height: 185.0,
            child: Image.asset(
              aboutPicturePath,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը: ',
            style: AppFonts.body,
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/about_us_bg_2.png',
            width: 261,
            height: 268,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: contentSeparationPaddingMobile),
          Text('our_strengths'.tr, style: AppFonts.subTitleMobile),
          const SizedBox(height: 12),
          const Text(
            'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը: ',
            style: AppFonts.body,
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 135.0,
            width: double.maxFinite,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Image.asset('assets/news_item.png'),
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemCount: 30,
            ),
          ),
          const SizedBox(height: contentSeparationPaddingMobile),
          const ContactInfoWidget(),
          const SizedBox(height: 24),
          HtmlWidget(
            '<iframe style="width:343px; height:185px;" src="$aboutVideoUrl" frameborder="0"></iframe>',
          ),
        ],
      ),
    );
  }
}
