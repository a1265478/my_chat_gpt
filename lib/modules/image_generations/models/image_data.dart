import 'package:my_chat_gpt/const/enum.dart';

class ImageData {
  final String imageUrl;
  final Status status;

  ImageData({required this.imageUrl, required this.status});

  factory ImageData.fromJson(String imageUrl) {
    return ImageData(imageUrl: imageUrl, status: Status.init);
  }

  ImageData copyWith({
    String? imageUrl,
    Status? status,
  }) {
    return ImageData(
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
    );
  }
}
