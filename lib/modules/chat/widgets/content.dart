import 'package:flutter/material.dart';
import '/modules/chat/models/chat.dart';
import '/const/const.dart';
import '/utils/asset_manager.dart';

class Content extends StatelessWidget {
  const Content({super.key, required this.chat});
  final Chat chat;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: chat.isBot ? kCardColor : kScaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chat.isBot ? AssetManager.botImage : AssetManager.userImage,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 8),
                Expanded(
                    child:
                        SelectableText(chat.message, style: kContentTextStyle)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
