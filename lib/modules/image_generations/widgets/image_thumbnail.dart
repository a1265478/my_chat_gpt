import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:my_chat_gpt/const/enum.dart';
import '/modules/image_generations/image_generations.dart';

class ImageThumbnail extends StatelessWidget {
  const ImageThumbnail({
    super.key,
    required this.index,
    required this.imageData,
  });
  final int index;
  final ImageData imageData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: imageData.imageUrl,
          cacheKey: imageData.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Container(child: Lottie.asset('assets/lotties/generating.json')),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () =>
                BlocProvider.of<ImageCubit>(context).downloadImage(index),
            child: Container(
              padding: const EdgeInsets.only(right: 5, bottom: 5),
              color: Colors.transparent,
              alignment: Alignment.bottomRight,
              width: 40,
              height: 40,
              child: _DownloadStatusIcon(imageData: imageData),
            ),
          ),
        ),
      ],
    );
  }
}

class _DownloadStatusIcon extends StatelessWidget {
  const _DownloadStatusIcon({
    super.key,
    required this.imageData,
  });
  final ImageData imageData;
  @override
  Widget build(BuildContext context) {
    switch (imageData.status) {
      case Status.init:
        return LottieBuilder.asset(
          'assets/lotties/download.json',
          repeat: false,
        );
      case Status.working:
        return LottieBuilder.asset('assets/lotties/loading.json');
      case Status.success:
        return LottieBuilder.asset(
          'assets/lotties/success.json',
          repeat: false,
        );
      case Status.fail:
        return LottieBuilder.asset(
          'assets/lotties/fail.json',
          repeat: false,
        );
    }
  }
}
