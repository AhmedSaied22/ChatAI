
import 'package:chat_ai/models/chat_models.dart';
import 'package:chat_ai/utils/constants.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  static Future<String> chatTextGenerationRepo(
      List<ChatModel> previousMessages) async {
    try {
      Dio dio = Dio();
      var response = await dio
          .post('$baseUrl/gemini-1.0-pro:generateContent?key=$apiKey', data: {
        "contents": previousMessages.map((e) => e.toJson()).toList(),
        "generationConfig": {
          "temperature": 0.9,
          "topK": 1,
          "topP": 1,
          "maxOutputTokens": 2048,
          "stopSequences": []
        },
        "safetySettings": [
          {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          },
          {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "BLOCK_MEDIUM_AND_ABOVE"
          }
        ]
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response.data['candidates'][0]['content']['parts'][0][kMessage];
      }
      return 'Loading';
    } catch (e) {
      return 'oops there was an error, try later';
    }
  }
}
