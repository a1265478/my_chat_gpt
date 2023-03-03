import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_gpt/modules/chat/cubit/chat_cubit.dart';

class MessageInputField extends StatefulWidget {
  const MessageInputField({super.key});

  @override
  State<MessageInputField> createState() => _MessageInputFieldState();
}

class _MessageInputFieldState extends State<MessageInputField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: textEditingController,
          style: const TextStyle(color: Colors.grey),
          onSubmitted: (value) {},
          decoration: const InputDecoration(
            hintText: "How can I Help you",
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        )),
        IconButton(
          onPressed: () {
            BlocProvider.of<ChatCubit>(context)
                .sendMessage(textEditingController.text);
            textEditingController.clear();
          },
          icon: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
