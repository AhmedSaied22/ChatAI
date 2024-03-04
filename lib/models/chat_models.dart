class ChatModel {
  final String role;
  final dynamic parts;

  ChatModel({required this.role, required this.parts});
  factory ChatModel.fromjson(jsonData) {
    return ChatModel(
        role: jsonData['contents'][0]['role'],
        parts: jsonData['rating'] == null
            ? null
            : ChatPartModel.fromJson(jsonData['text']));
  }
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});
  factory ChatPartModel.fromJson(jsonData) {
    return ChatPartModel(text: jsonData['text']);
  }
}
