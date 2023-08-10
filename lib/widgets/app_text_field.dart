import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({Key? key}) : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _isSelected = false;
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _hasError ? Colors.red : Colors.grey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: _isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      onChanged: (value) {
        setState(() {
          _hasError = false;
        });
      },
      onTap: () {
        setState(() {
          _isSelected = true;
        });
      },
      onFieldSubmitted: (value) {
        setState(() {
          _isSelected = false;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            _hasError = true;
          });
          return 'Username is required';
        }
        return null;
      },
    );
  }
}
