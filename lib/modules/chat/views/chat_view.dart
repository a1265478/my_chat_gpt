import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_gpt/const/enum.dart';
import '../cubit/chat_cubit.dart';
import '/modules/chat/widgets/widgets.dart';
import '/const/const.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with AutomaticKeepAliveClientMixin {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Flexible(
                child: ListView.builder(
                  itemCount: state.chatList.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Content(chat: state.chatList[index]),
                      if (state.responseStatus == Status.working &&
                          index == state.chatList.length - 1)
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              '對方正在輸入中',
                              textStyle: kContentTextStyle,
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
          Container(
            color: kCardColor,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: MessageInputField(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
