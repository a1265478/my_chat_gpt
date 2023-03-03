part of 'image_cubit.dart';

class ImageState extends Equatable {
  const ImageState({
    this.responseStatus = Status.init,
    this.imageUrlList = const [],
    this.imageSize = "256x256",
    this.description = "",
  });
  final Status responseStatus;
  final List<ImageData> imageUrlList;
  final String imageSize;
  final String description;

  @override
  List<Object> get props =>
      [responseStatus, imageUrlList, imageSize, description];

  ImageState copyWith({
    Status? responseStatus,
    List<ImageData>? imageUrlList,
    String? imageSize,
    String? description,
  }) {
    return ImageState(
      responseStatus: responseStatus ?? this.responseStatus,
      imageUrlList: imageUrlList ?? this.imageUrlList,
      imageSize: imageSize ?? this.imageSize,
      description: description ?? this.description,
    );
  }
}

class ImageInitial extends ImageState {}
