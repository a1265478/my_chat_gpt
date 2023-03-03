import 'package:flutter/material.dart';

import '../image_generations.dart';

class ImageGenerationsView extends StatefulWidget {
  const ImageGenerationsView({super.key});

  @override
  State<ImageGenerationsView> createState() => _ImageGenerationsViewState();
}

class _ImageGenerationsViewState extends State<ImageGenerationsView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: const [
            SizedBox(height: 15),
            SizeRadiusButton(),
            SizedBox(height: 15),
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

  @override
  bool get wantKeepAlive => true;
}
