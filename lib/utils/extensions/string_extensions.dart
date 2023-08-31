extension StringHelper on String {

  // Regular expression to match a valid URL
  bool isUrlValid() {
    final pattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';
    final regExp = RegExp(pattern, caseSensitive: false, multiLine: false);
    return regExp.hasMatch(this);
  }
}
