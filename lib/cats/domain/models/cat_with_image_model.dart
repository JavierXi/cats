class CatWithImageModel {
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  CatWithImageModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatWithImageModel.fromJson(Map<String, dynamic> json) {
    return CatWithImageModel(
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'width': width,
      'height': height,
    };
  }
}
