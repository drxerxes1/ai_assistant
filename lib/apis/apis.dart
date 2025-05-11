import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_assistant/helper/global.dart';
import 'package:http/http.dart';

class APIs {
  static Future<String> getAnswer(String query) async {
    try {
      final response = await post(
        Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        },
        body: jsonEncode(
          {
            "model": "meta-llama/llama-4-maverick:free",
            "messages": [
              {
                "role": "user",
                "content": query,
              }
            ],
          },
        ),
      );

      final data = jsonDecode(response.body);

      log('response: $data');

      return data['choices'][0]['message']['content'];
    } catch (e) {
      log('Error: $e');
      return 'Something went wrong';
    }
  }
}
