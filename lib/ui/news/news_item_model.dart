class NewsItemModel {
  static const String _titleKey = 'title';
  static const String _descriptionKey = 'description';
  static const String _imageUrlKey = 'imageUrl';
  static const String _dateKey = 'date';

  final String _title;
  final String _description;
  final String _imageUrl;
  final String _date;

  NewsItemModel({
    required String title,
    required String description,
    required String imageUrl,
    required String date,
  })  : _title = title,
        _description = description,
        _date = date,
        _imageUrl = imageUrl;

  String get title => _title;

  String get description => _description;

  String get date => _date;

  String get imageUrl => _imageUrl;

  factory NewsItemModel.fromJson(Map<String, dynamic> json) {
    return NewsItemModel(
      title: (json[_titleKey] ?? '') as String,
      description: (json[_descriptionKey] ?? '') as String,
      date: (json[_dateKey] ?? '') as String,
      imageUrl: (json[_imageUrlKey] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _titleKey: title,
      _descriptionKey: description,
      _dateKey: date,
      _imageUrlKey: imageUrl,
    };
  }
}
