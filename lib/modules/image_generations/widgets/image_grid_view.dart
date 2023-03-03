import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '/const/enum.dart';

import '../image_generations.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        switch (state.responseStatus) {
          case Status.init:
            return const SizedBox();
          case Status.working:
            return AspectRatio(
              aspectRatio: 1,
              child: Lottie.asset('assets/lotties/drawing.json'),
            );
          case Status.success:
            return GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: List.generate(
                state.imageUrlList.length,
                (index) => ImageThumbnail(
                  index: index,
                  imageData: state.imageUrlList[index],
                ),
              ),
            );
          case Status.fail:
            return Lottie.asset('assets/lotties/error.json');
        }
      },
    );
  }
}
