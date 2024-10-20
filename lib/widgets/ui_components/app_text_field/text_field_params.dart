import 'package:flutter/material.dart';

class TextFieldParams {
  final TextEditingController _controller;
  final VoidCallback? _onChanged;
  final VoidCallback? _onSubmitted;
  final FormFieldValidator<String>? _validator;
  final int? _maxLines;
  final String? _label;
  final String? _hintText;

  TextFieldParams({
    required TextEditingController controller,
    VoidCallback? onChanged,
    VoidCallback? onSubmitted,
    FormFieldValidator<String>? validator,
    int? maxLines,
    String? label,
    String? hintText,
  })  : _controller = controller,
        _onChanged = onChanged,
        _onSubmitted = onSubmitted,
        _validator = validator,
        _maxLines = maxLines,
        _label = label,
        _hintText = hintText;

  TextEditingController get controller => _controller;

  VoidCallback? get onChanged => _onChanged;

  VoidCallback? get onSubmitted => _onSubmitted;

  FormFieldValidator<String>? get validator => _validator;

  int? get maxLines => _maxLines;

  String? get label => _label;

  String? get hintText => _hintText;
}
