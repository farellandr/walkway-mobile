import 'package:walkway_mobile/domain/models/image.dart';

class Brand {
  final String name;
  final Images? image;

  Brand({
    required this.name,
    this.image,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'] ?? '',
      image: json['image'] != null ? Images.fromJson(json['image']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image?.toJson(),
    };
  }
}
