part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<Chat> chatList;
  final Status responseStatus;

  const ChatState({
    this.chatList = const [],
    this.responseStatus = Status.init,
  });

  ChatState copyWith({
    List<Chat>? chatList,
    Status? responseStatus,
  }) {
    return ChatState(
      chatList: chatList ?? this.chatList,
      responseStatus: responseStatus ?? this.responseStatus,
    );
  }

  @override
  List<Object?> get props => [chatList, responseStatus];
}

class ChatInitial extends ChatState {}
