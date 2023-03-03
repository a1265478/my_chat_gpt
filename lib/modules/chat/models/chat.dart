class Chat {
  final String message;
  final bool isBot;

  Chat({
    required this.message,
    required this.isBot,
  });

  factory Chat.fromJson(Map<String, dynamic> map) {
    final regex = RegExp(r'[\n]*\n');
    return Chat(
        message: (map['message']['content']).toString().replaceFirst(regex, ''),
        isBot: true);
  }
}
