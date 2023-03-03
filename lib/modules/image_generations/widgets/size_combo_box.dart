import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/const/const.dart';

import '../image_generations.dart';

class ImageSizeComboBox extends StatelessWidget {
  const ImageSizeComboBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return DropdownButton<String>(
          items: acceptImageSize
              .map<DropdownMenuItem<String>>(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
              .toList(),
          value: state.imageSize,
          onChanged: (value) {
            if (value == null) return;
            BlocProvider.of<ImageCubit>(context).changeImageSize(value);
          },
          dropdownColor: kScaffoldBackgroundColor,
        );
      },
    );
  }
}
