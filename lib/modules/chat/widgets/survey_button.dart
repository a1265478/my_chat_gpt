import 'package:flutter/material.dart';

class SurveyButton extends StatelessWidget {
  const SurveyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.thumb_up_alt_outlined,
          color: Colors.white,
        ),
        SizedBox(width: 5),
        Icon(
          Icons.thumb_down_alt_outlined,
          color: Colors.white,
        ),
      ],
    );
  }
}
