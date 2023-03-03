import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_gpt/const/const.dart';
import 'package:my_chat_gpt/modules/image_generations/cubit/image_cubit.dart';

class DescriptionTextArea extends StatelessWidget {
  const DescriptionTextArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kCardColor,
      child: TextField(
        autofocus: true,
        autocorrect: false,
        maxLines: 4,
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
          hintText: "Describe the image situation",
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(10),
        ),
        onChanged: (value) {
          BlocProvider.of<ImageCubit>(context).changeDescription(value);
        },
      ),
    );
  }
}
