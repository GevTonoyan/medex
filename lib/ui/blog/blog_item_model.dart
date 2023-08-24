class BlogItemModel {
  static const String _titleKey = 'title';
  static const String _shortDescriptionKey = 'shortDescription';
  static const String _fullDescriptionKey = 'fullDescription';
  static const String _imageUrlKey = 'imageUrl';

  final String _title;
  final String _shortDescription;
  final String _fullDescription;
  final String _imageUrl;

  BlogItemModel({
    required String title,
    required String shortDescription,
    required String fullDescription,
    required String imageUrl,
  })  : _title = title,
        _shortDescription = shortDescription,
        _fullDescription = fullDescription,
        _imageUrl = imageUrl;

  String get title => _title;

  String get shortDescription => _shortDescription;

  String get fullDescription => _fullDescription;

  String get imageUrl => _imageUrl;

  factory BlogItemModel.fromJson(Map<String, dynamic> json) {
    return BlogItemModel(
      title: (json[_titleKey] ?? '') as String,
      shortDescription: (json[_shortDescriptionKey] ?? '') as String,
      fullDescription: (json[_fullDescriptionKey] ?? '') as String,
      imageUrl: (json[_imageUrlKey] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _titleKey: title,
      _shortDescriptionKey: shortDescription,
      _fullDescriptionKey: fullDescription,
      _imageUrlKey: imageUrl,
    };
  }
}
