class BlogItemModel {
  static const String _titleKey = 'title';
  static const String _descriptionKey = 'description';
  static const String _imageUrlKey = 'imageUrl';

  final String _title;
  final String _description;
  final String _imageUrl;

  BlogItemModel({
    required String title,
    required String description,
    required String imageUrl,
  })  : _title = title,
        _description = description,
        _imageUrl = imageUrl;

  String get title => _title;

  String get description => _description;

  String get imageUrl => _imageUrl;

  factory BlogItemModel.fromJson(Map<String, dynamic> json) {
    return BlogItemModel(
      title: (json[_titleKey] ?? '') as String,
      description: (json[_descriptionKey] ?? '') as String,
      imageUrl: (json[_imageUrlKey] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _titleKey: title,
      _descriptionKey: description,
      _imageUrlKey: imageUrl,
    };
  }

  @override
  String toString() {
    return 'BlogItemModel { title: $title, description: $description, imageUrl: $imageUrl }';
  }
}
