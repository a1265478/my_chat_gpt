import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/const/const.dart';
import '/modules/image_generations/cubit/image_cubit.dart';

class GeneratorButton extends StatelessWidget {
  const GeneratorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => BlocProvider.of<ImageCubit>(context).generateImage(),
      style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
      child: const Text("Generator"),
    );
  }
}
