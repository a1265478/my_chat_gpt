import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/const/enum.dart';
import '/utils/api_service.dart';

import '../models/chat.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  Future<void> sendMessage(String message) async {
    try {
      emit(
        state.copyWith(
            responseStatus: Status.working,
            chatList: List.from(state.chatList)
              ..add(Chat(isBot: false, message: message))),
      );
      final response = await ApiService.sendMessage(message);
      emit(
        state.copyWith(
            responseStatus: Status.success,
            chatList: List.from(state.chatList)..addAll(response)),
      );
    } catch (_) {}
  }
}
