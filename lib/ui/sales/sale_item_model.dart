class SaleItemModel {
  static const String _titleKey = 'title';
  static const String _descriptionKey = 'description';
  static const String _assetUrlKey = 'assetUrl';

  final String _title;
  final String _description;
  final String _imageUrl;

  SaleItemModel({
    required String title,
    required String description,
    required String imageUrl,
  })  : _title = title,
        _description = description,
        _imageUrl = imageUrl;

  String get title => _title;

  String get description => _description;

  String get imageUrl => _imageUrl;

  factory SaleItemModel.fromJson(Map<String, dynamic> json) {
    return SaleItemModel(
      title: (json[_titleKey] ?? '') as String,
      description: (json[_descriptionKey] ?? '') as String,
      imageUrl: (json[_assetUrlKey] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      _titleKey: title,
      _descriptionKey: description,
      _assetUrlKey: imageUrl,
    };
  }
}
