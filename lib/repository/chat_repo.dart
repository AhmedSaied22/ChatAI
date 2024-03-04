import 'dart:developer';

import 'package:chat_ai/models/chat_models.dart';
import 'package:chat_ai/utils/constants.dart';
import 'package:dio/dio.dart';

class ChatRepo {
  static chatTextGenerationRepo(List<ChatModel> previousMessages) async {
    try {
      Dio dio = Dio();
      var response = await dio
          .post('$baseUrl/gemini-1.0-pro:generateContent?key=$apiKey', data: {
        "contents": [
          {
            "role": "user",
            "parts": [
              {"text": "hello"}
            ]
          },
          {
            "role": "model",
            "parts": [
              {"text": "Hi there! How can I help you today?"}
            ]
          },
          {
            "role": "user",
            "parts": [
              {"text": "How are you?"}
            ]
          }
        ],
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
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
