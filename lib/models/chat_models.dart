import 'package:chat_ai/utils/constants.dart';

class ChatModel {
  final String role;
  final List<ChatPartModel> parts;

  ChatModel({required this.role, required this.parts});

  factory ChatModel.fromJson(jsonData) {
    final List<dynamic> partsData = jsonData['parts'];
    final List<ChatPartModel> parts = partsData.map((partData) {
      return ChatPartModel.fromJson(partData);
    }).toList();

    return ChatModel(
      role: jsonData['contents'][0]['role'],
      parts: parts,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'parts': parts.map((x) => x.toJson()).toList(),
    };
  }
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});

  factory ChatPartModel.fromJson(Map<String, dynamic> jsonData) {
    return ChatPartModel(
      text: jsonData[kMessage] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      kMessage: text,
    };
  }
}
// class ChatModel {
//   final String role;
//   final List<ChatPartModel> parts;

//   ChatModel({required this.role, required this.parts});
//   factory ChatModel.fromjson(jsonData) {
//     final List<dynamic> partsData = jsonData['parts'];
//     final List<ChatPartModel> parts = partsData.map((partData) {
//       return ChatPartModel.fromJson(partData);
//     }).toList();
//     return ChatModel(
//       role: jsonData['contents'][0]['role'],
//       parts: parts,
//     );
//   }
// }

// class ChatPartModel {
//   final String text;

//   ChatPartModel({required this.text});
//   factory ChatPartModel.fromJson(jsonData) {
//     return ChatPartModel(text: jsonData['text']);
//   }
// }
