import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medex/theming/fonts.dart';
import 'package:medex/ui/home/home_view_model.dart';
import 'package:medex/widgets/default_button_1.dart';

const _serviceIcon1Path = 'assets/service_icon_1.svg';
const _serviceIcon2Path = 'assets/service_icon_2.svg';
const _serviceIcon3Path = 'assets/service_icon_3.svg';
const _serviceIcon4Path = 'assets/service_icon_4.svg';

class MainServicesWidget extends StatelessWidget {
  const MainServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'services'.tr,
            style: AppFonts.title,
          ),
          const SizedBox(height: 12),
          Text('main_services_description'.tr, style: AppFonts.body),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ServiceIconText(assetPath: _serviceIcon1Path, label: 'service1_description'.tr),
              _ServiceIconText(assetPath: _serviceIcon2Path, label: 'service2_description'.tr),
              _ServiceIconText(assetPath: _serviceIcon3Path, label: 'service3_description'.tr),
              _ServiceIconText(assetPath: _serviceIcon4Path, label: 'service4_description'.tr),
            ],
          ),
          const SizedBox(height: 32),
          DefaultButton1(label: 'see_all1'.tr, onPressed: () {
            final HomeViewModel viewModel  = Get.find();
            viewModel.changePage(AppPages.services);
          })
        ],
      ),
    );
  }
}

class _ServiceIconText extends StatelessWidget {
  final String assetPath;
  final String label;

  const _ServiceIconText({
    Key? key,
    required this.assetPath,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          assetPath,
          semanticsLabel: 'Medex',
          width: 53,
          height: 53,
        ),
        const SizedBox(height: 12),
        Text(label, style: AppFonts.body),
      ],
    );
  }
}
