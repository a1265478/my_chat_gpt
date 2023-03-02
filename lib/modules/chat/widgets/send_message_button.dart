import 'package:flutter/material.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.send,
        color: Colors.white,
      ),
    );
  }
}
