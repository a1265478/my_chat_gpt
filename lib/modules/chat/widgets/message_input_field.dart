import 'package:flutter/material.dart';

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
    return TextField(
      controller: textEditingController,
      style: const TextStyle(color: Colors.grey),
      onSubmitted: (value) {},
      decoration: const InputDecoration(
        hintText: "How can I Help you",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
