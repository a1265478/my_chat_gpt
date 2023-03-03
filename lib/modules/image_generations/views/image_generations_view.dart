import 'package:flutter/material.dart';

import '../image_generations.dart';

class ImageGenerationsView extends StatelessWidget {
  const ImageGenerationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: const [
            ImageSizeComboBox(),
            SizedBox(height: 5),
            DescriptionTextArea(),
            SizedBox(height: 5),
            GeneratorButton(),
            SizedBox(height: 10),
            Expanded(child: ImageGridView()),
          ],
        ),
      ),
    );
  }
}
