class Topic {
  final int id;
  final String imageUrl;
  final String description;
  final String title;
  final String ustadzName;
  final int status;

  Topic({
    required this.id,
    required this.status,
    required this.imageUrl,
    required this.description,
    required this.title,
    required this.ustadzName,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'],
      status: json['status'],
      imageUrl: json['image_url'],
      description: json.containsKey('description') ? json['description'] : '',
      title: json['title'],
      ustadzName: json['ustadz_name'],
    );
  }
}
