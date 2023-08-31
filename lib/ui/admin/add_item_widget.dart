import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/theming/app_fonts.dart';
import 'package:medex/ui/admin/admin_view_model.dart';
import 'package:medex/utils/extensions/string_extensions.dart';
import 'package:medex/widgets/app_loading.dart';
import 'package:medex/widgets/app_text_field/text_field_params.dart';
import 'package:medex/widgets/default_button_1.dart';
import 'text_field_container.dart';

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({Key? key}) : super(key: key);

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final AdminViewModel viewModel = Get.find();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            viewModel.selectedPage.addText,
            style: AppFonts.title,
          ),
          const SizedBox(height: 40),
          TextFieldContainer(
            params: TextFieldParams(
              controller: _titleController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'title_error'.tr;
                }
                return null;
              },
              label: 'add_title'.tr,
            ),
          ),
          const SizedBox(height: 40),
          TextFieldContainer(
            params: TextFieldParams(
                controller: _imageUrlController,
                validator: (String? value) {
                  if (value == null || !value.isUrlValid()) {
                    return 'image_url_error'.tr;
                  }
                  return null;
                },
                label: 'add_image'.tr),
          ),
          const SizedBox(height: 40),
          TextFieldContainer(
            params: TextFieldParams(
                controller: _descriptionController,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'description_error'.tr;
                  }
                  return null;
                },
                label: 'add_description'.tr),
          ),
          const SizedBox(height: 40),
          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: viewModel.isSavingItem
                  ? const AppLoading()
                  : DefaultButton1(
                      label: 'save'.tr,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          viewModel.addItemToFirestore(
                            title: _titleController.text,
                            imageUrl: _imageUrlController.text,
                            description: _descriptionController.text,
                          );
                        }
                      }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
