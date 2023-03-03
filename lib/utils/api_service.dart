import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_chat_gpt/modules/chat/models/chat.dart';
import 'package:my_chat_gpt/modules/image_generations/image_generations.dart';

import 'enviroment.dart';

class ApiService {
  static Future<List<Chat>> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse("${Enviroment.baseUrl}/chat/completions"),
        headers: {
          'Authorization': 'Bearer ${Enviroment.apiKey}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            'model': 'gpt-3.5-turbo',
            'messages': [
              {
                'role': 'user',
                'content': message,
              }
            ]
          },
        ),
      );

      Map jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonResponse['error'] != null) {
        throw Exception(jsonResponse['error']['message']);
      }

      final List answerList = jsonResponse['choices'];
      return answerList.map((e) => Chat.fromJson(e)).toList();
    } catch (_) {
      rethrow;
    }
  }

  static Future<List<ImageData>> imageGeneration(
      String size, String description) async {
    try {
      final response = await http.post(
        Uri.parse("${Enviroment.baseUrl}/images/generations"),
        headers: {
          'Authorization': 'Bearer ${Enviroment.apiKey}',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {
            'prompt': description,
            'n': 2,
            'size': size,
          },
        ),
      );

      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw Exception(jsonResponse['error']['message']);
      }
      final List imageList = jsonResponse['data'];
      return imageList
          .map((e) => ImageData.fromJson(e['url'].toString()))
          .toList();
    } catch (_) {
      rethrow;
    }
  }
}
