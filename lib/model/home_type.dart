import 'package:ai_assistant/screen/feature/chatbot_feature.dart';
import 'package:ai_assistant/screen/feature/image_feature.dart';
import 'package:ai_assistant/screen/feature/translator_feature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum HomeType {aiChatbot, aiImage, aiTranslator}

extension HomeTypeExtension on HomeType {
  String get name {
    switch (this) {
      case HomeType.aiChatbot:
        return 'AI Chatbot';
      case HomeType.aiImage:
        return 'AI Image Generator';
      case HomeType.aiTranslator:
        return 'AI Translator';
    }
  }
  String get lottie {
    switch (this) {
      case HomeType.aiChatbot:
        return 'assets/lottie/ai_ask_me.json';
      case HomeType.aiImage:
        return 'assets/lottie/imagination.json';
      case HomeType.aiTranslator:
        return 'assets/lottie/translate.json';
    }
  }

  VoidCallback get onTap => switch (this) {
    HomeType.aiChatbot => () => Get.to(() => const ChatbotFeature()),
    HomeType.aiImage => () => Get.to(() => const ImageFeature()),
    HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
  };
}