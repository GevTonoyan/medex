import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/main/main_about_widget.dart';
import 'package:medex/utils/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        pageContentLeftPadding,
        pageContentTopPadding,
        pageContentRightPadding,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'about'.tr,
                        style: AppFonts.title,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'established'.tr,
                        style: AppFonts.subTitle,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը:',
                        style: AppFonts.body,
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 750.0,
                        height: 404.0,
                        child: Image.asset(
                          aboutPicturePath,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը: ',
                        style: AppFonts.body,
                      ),
                    ],
                  )),
              Expanded(
                flex: 3,
                child: SvgPicture.asset(
                  'assets/background_1.svg',
                  semanticsLabel: 'Medex',
                ),
              )
            ],
          ),
          const SizedBox(height: contentSeparationPadding),
          Text(
            'our_strengths'.tr,
            style: AppFonts.subTitle,
          ),
          const SizedBox(height: 12),
          const Text(
            'Հակառակ ընդհանուր պատկերացմանը` Lorem Ipsum-ը այդքան էլ պատահական հավաքված տեքստ չէ: Այս տեքստի արմատները հասնում են Ք.ա. 45թ. դասական լատինական գրականություն. այն 2000 տարեկան է: Ռիչարդ ՄքՔլինտոքը` Վիրջինիայի Համպդեն-Սիդնեյ քոլեջում լատիներենի մի դասախոս` ուսումնասիրելով Lorem Ipsum տեքստի ամենատարօրինակ բառերից մեկը` consectetur-ը, և այն որոնելով դասական գրականության մեջ` բացահայտեց դրա իսկական աղբյուրը: ',
            style: AppFonts.body,
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 250.0,
            width: double.maxFinite,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Image.asset('assets/news_item.png'),
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemCount: 30,
            ),
          ),
          const SizedBox(height: contentSeparationPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'how_find_us'.tr,
                    style: AppFonts.subTitle,
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    'address'.tr,
                    style: AppFonts.bodyBold,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '0035, Ազատության 49/1, Երևան, Հայաստան',
                    style: AppFonts.body,
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'working_hours'.tr,
                    style: AppFonts.bodyBold,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Երկուշաբթի-ուրբաթ՝ 9։00-18։00\nՇաբաթ-կիրակի՝ 12։00-16։00',
                    style: AppFonts.body,
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'phone_number'.tr,
                    style: AppFonts.bodyBold,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    '077 000 001',
                    style: AppFonts.body,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    'email'.tr,
                    style: AppFonts.bodyBold,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'medex@clinic',
                    style: AppFonts.body,
                  )
                ],
              ),
              const SizedBox(width: contentSeparationPadding),
              SizedBox(
                width: 600.0,
                height: 350.0,
                child: Image.asset(aboutPicturePath, fit: BoxFit.fill,),
              ),
            ],
          ),
          const SizedBox(height: contentSeparationPadding),
        ],
      ),
    );
  }
}
