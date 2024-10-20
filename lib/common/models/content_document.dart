class ContentDocument {
  final String title;
  final String description;

  const ContentDocument({
    required this.title,
    required this.description,
  });

  factory ContentDocument.fromJson(Map<String, dynamic> json) {
    return ContentDocument(
      title: (json['title'] ?? '') as String,
      description: (json['description'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
