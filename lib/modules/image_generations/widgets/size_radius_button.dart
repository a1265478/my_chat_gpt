import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_gpt/const/const.dart';

import '../image_generations.dart';

class SizeRadiusButton extends StatelessWidget {
  const SizeRadiusButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            acceptImageSize.length,
            (index) => _RadiusButton(
              isSelected: state.imageSize == acceptImageSize[index],
              label: acceptImageSize[index],
            ),
          ),
        );
      },
    );
  }
}

class _RadiusButton extends StatelessWidget {
  const _RadiusButton({
    super.key,
    required this.label,
    required this.isSelected,
  });
  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<ImageCubit>(context).changeImageSize(label),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? kButtonColor : kCardColor,
        ),
        child: Text(label, style: k14TextStyle),
      ),
    );
  }
}
