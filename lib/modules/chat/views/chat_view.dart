import 'package:flutter/material.dart';
import 'package:my_chat_gpt/modules/chat/widgets/widgets.dart';
import '/modules/chat/widgets/content.dart';
import '/const/const.dart';
import '/const/fake_data.dart';
import '/utils/asset_manager.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(AssetManager.openaiLogo),
        ),
        title: const Text("ChatGPT"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: chatMessages.length,
                itemBuilder: (context, index) =>
                    Content(chat: chatMessages[index]),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              color: kCardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Expanded(child: MessageInputField()),
                    SendMessageButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
