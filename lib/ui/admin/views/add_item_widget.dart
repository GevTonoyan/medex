import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medex/common/models/content_document.dart';
import 'package:medex/core/theming/app_fonts.dart';
import 'package:medex/core/utils/extensions/string_extensions.dart';
import 'package:medex/ui/admin/view_models/admin_view_model.dart';
import 'package:medex/widgets/app_snackbar.dart';
import 'package:medex/widgets/ui_components/app_loading.dart';
import 'package:medex/widgets/ui_components/app_text_field/text_field_params.dart';
import 'package:medex/widgets/ui_components/default_button_1.dart';
import 'text_field_container.dart';

class AddItemWidget extends StatefulWidget {
  const AddItemWidget({Key? key}) : super(key: key);

  @override
  State<AddItemWidget> createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {
  final _titleControllerAm = TextEditingController();
  final _titleControllerRu = TextEditingController();
  final _titleControllerEn = TextEditingController();

  final _imageUrlController = TextEditingController();

  final _descriptionControllerAm = TextEditingController();
  final _descriptionControllerRu = TextEditingController();
  final _descriptionControllerEn = TextEditingController();

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
            style: AppFonts.titleDesktop,
          ),
          const SizedBox(height: 40),
          TextFieldContainer(
            label: 'add_title'.tr,
            params: [
              TextFieldParams(
                controller: _titleControllerAm,
                label: 'add_title_am'.tr,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'title_error'.tr;
                  }
                  return null;
                },
              ),
              TextFieldParams(
                controller: _titleControllerRu,
                label: 'add_title_ru'.tr,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'title_error'.tr;
                  }
                  return null;
                },
              ),
              TextFieldParams(
                controller: _titleControllerEn,
                label: 'add_title_en'.tr,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'title_error'.tr;
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          TextFieldContainer(
            label: 'add_image'.tr,
            params: [
              TextFieldParams(
                controller: _imageUrlController,
                validator: (String? value) {
                  if (value == null || !value.isUrlValid()) {
                    return 'image_url_error'.tr;
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          TextFieldContainer(
            label: 'add_description'.tr,
            params: [
              TextFieldParams(
                controller: _descriptionControllerAm,
                label: 'add_description_am'.tr,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'description_error'.tr;
                  }
                  return null;
                },
                maxLines: 4,
              ),
              TextFieldParams(
                controller: _descriptionControllerRu,
                label: 'add_description_ru'.tr,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'description_error'.tr;
                  }
                  return null;
                },
                maxLines: 4,
              ),
              TextFieldParams(
                controller: _descriptionControllerEn,
                label: 'add_description_en'.tr,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'description_error'.tr;
                  }
                  return null;
                },
                maxLines: 4,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: viewModel.isSavingItem
                  ? const AppLoading()
                  : DefaultButton1(
                      label: 'save'.tr,
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final success = await viewModel.addItemToFirestore(
                            amContent: ContentDocument(
                              title: _titleControllerAm.text,
                              description: _descriptionControllerAm.text,
                            ),
                            ruContent: ContentDocument(
                              title: _titleControllerRu.text,
                              description: _descriptionControllerRu.text,
                            ),
                            enContent: ContentDocument(
                              title: _titleControllerEn.text,
                              description: _descriptionControllerEn.text,
                            ),
                            imageUrl: _imageUrlController.text,
                          );
                          if (success) {
                            _resetAllFields();
                            ScaffoldMessenger.of(context).showSnackBar(
                              AppSnackBar(
                                message: 'success_upload'.tr,
                              ),
                            );
                          }
                        }
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _titleControllerAm.dispose();
    _titleControllerRu.dispose();
    _titleControllerEn.dispose();

    _imageUrlController.dispose();
    _descriptionControllerAm.dispose();
    super.dispose();
  }

  void _resetAllFields() {
    _titleControllerAm.clear();
    _titleControllerRu.clear();
    _titleControllerEn.clear();

    _imageUrlController.clear();

    _descriptionControllerAm.clear();
    _descriptionControllerRu.clear();
    _descriptionControllerEn.clear();
  }
}
