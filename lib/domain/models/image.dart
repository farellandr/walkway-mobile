class Images {
  final String filename;

  Images({
    required this.filename,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      filename: json['filename'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
    };
  }
}
