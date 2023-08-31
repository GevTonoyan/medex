extension StringHelper on String {
  // Regular expression to match a valid URL
  bool isUrlValid() {
    final pattern = r'^(https?|ftp)://[^\s/$.?#].[^\s]*$';
    final regExp = RegExp(pattern, caseSensitive: false, multiLine: false);
    return regExp.hasMatch(this);
  }

  /// Splits the description text into two parts based on the maximum number of words
  /// for the first part. If the description contains fewer words than the specified
  /// maximum, the entire text is placed in the second part.
  ///
  /// Parameters:
  /// - maxWords: The maximum number of words for the first part of the description.
  ///
  /// Returns:
  /// A list of two strings representing the first and second parts of the description.
  List<String> splitDescription({int maxWords = 40}) {
    List<String> words = split(' ');
    var firstPart = '';
    var secondPart = '';

    if (words.length <= maxWords) {
      secondPart = this;
    } else {
      firstPart = words.sublist(0, maxWords).join(' ');
      secondPart = words.sublist(maxWords).join(' ');
    }

    return <String>[firstPart, secondPart];
  }
}
