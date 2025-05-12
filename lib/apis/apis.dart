import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:ai_assistant/helper/global.dart';
import 'package:http/http.dart' as http;

class APIs {
  // Get answer from the AI API
  static Future<String> getAnswer(String query) async {
    try {
      final response = await http.post(
        Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $apiKey',
        },
        body: jsonEncode(
          {
            "model": "opengvlab/internvl3-14b:free",
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
      return 'Something went wrong. Try again later... 🤖';
    }
  }

  // Get image from the AI API
  static Future<List<String>> searchAIImage(String prompt) async {
    try {
      final response = await http
          .get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(response.body);

      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('Search Image Error: $e');
      return [];
    }
  }

  static Future<Uint8List?> generateImage(String prompt) async {
  var headers = {
    'Authorization': 'Bearer $apiKeyImage',
  };

  var request = http.MultipartRequest(
    'POST',
    Uri.parse('https://api.vyro.ai/v2/image/generations'),
  );

  request.fields.addAll({
    'prompt': prompt,
    'style': 'realistic',
    'aspect_ratio': '1:1',
    'seed': '5',
  });

  request.headers.addAll(headers);

  try {
    final response = await request.send();
    log('Response: ${response.statusCode}');
    log('Response: $response');

    if (response.statusCode == 200) {
      // Convert stream to bytes
      final bytes = await response.stream.toBytes();
      return bytes;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }

  return null;
}

}
