import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/ui/admin/view_models/admin_password_view_model.dart';
import 'package:medex/ui/admin/views/admin_screen.dart';
import 'package:medex/widgets/ui_components/app_loading.dart';
import 'package:medex/widgets/ui_components/app_text_field/app_text_field.dart';
import 'package:medex/widgets/ui_components/app_text_field/text_field_params.dart';
import 'package:medex/widgets/ui_components/default_button_1.dart';

class AdminPasswordDialogWidget extends StatefulWidget {
  const AdminPasswordDialogWidget({Key? key}) : super(key: key);

  @override
  State<AdminPasswordDialogWidget> createState() =>
      _AdminPasswordDialogWidgetState();
}

class _AdminPasswordDialogWidgetState extends State<AdminPasswordDialogWidget> {
  final TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AdminPasswordViewModel model = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 400),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'enter_admin_code'.tr,
                  style: AppFonts.subTitleDesktop,
                ),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: AppTextField(
                    params: TextFieldParams(
                      controller: controller,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'wrong_password'.tr;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Obx(() {
                  if (model.isLoading) {
                    return const AppLoading();
                  }
                  return DefaultButton1(
                      label: 'continue'.tr,
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (await model.isPasswordCorrect(controller.text)) {
                            Get.off(() => const AdminScreen());
                          } else {
                            //TODO show snack bar
                            print('wrong password');
                          }
                        }
                      });
                }),
              ],
            ),
            Positioned(
              right: 0,
              child: InkWell(
                onTap: () {
                  Get.back<void>();
                },
                child: Icon(
                  Icons.close,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
