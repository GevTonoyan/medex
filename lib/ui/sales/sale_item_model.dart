class SaleItemModel {
  static const String _titleKey = 'title';
  static const String _descriptionKey = 'description';
  static const String _imageUrlKey = 'imageUrl';
  static const String enableKey = 'enable';

  final String _title;
  final String _description;
  final String _imageUrl;
  final bool _enabled;

  SaleItemModel({
    required String title,
    required String description,
    required String imageUrl,
    bool enabled = true,
  })  : _title = title,
        _description = description,
        _imageUrl = imageUrl,
        _enabled = enabled;

  String get title => _title;

  String get description => _description;

  String get imageUrl => _imageUrl;

  bool get enabled => _enabled;

  factory SaleItemModel.fromJson(Map<String, dynamic> json) {
    return SaleItemModel(
      title: (json[_titleKey] ?? '') as String,
      description: (json[_descriptionKey] ?? '') as String,
      imageUrl: (json[_imageUrlKey] ?? '') as String,
      enabled: (json[enableKey] ?? true) as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _titleKey: title,
      _descriptionKey: description,
      _imageUrlKey: imageUrl,
      enableKey: enabled,
    };
  }
}
