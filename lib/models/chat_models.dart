class ChatModel {
  final String role;
  final List<ChatPartModel> parts;

  ChatModel({required this.role, required this.parts});
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});
}
