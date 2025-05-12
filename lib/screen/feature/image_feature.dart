import 'package:ai_assistant/controller/image_controller.dart';
import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/widget/custom_button.dart';
import 'package:ai_assistant/widget/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _controller = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          bottom: mq.height * 0.1,
          top: mq.height * 0.02,
          left: mq.width * 0.05,
          right: mq.width * 0.05,
        ),
        children: [
          // Text Field
          TextFormField(
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.sentences,
            minLines: 2,
            maxLines: null,
            controller: _controller.textController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              filled: true,
              hintText:
                  'Imagine something amazing... \n Type here & I will create it for you 🤖',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.blueGrey),
              ),
            ),
          ),

          // AI Image
          Container(
            height: mq.height * 0.5,
            alignment: Alignment.center,
            child: Obx(() => _aiImage()),
          ),

          // Create Button
          CustomButton(onTap: _controller.createAIImage, text: 'Create Image'),

          // Using Lexica API
          // CustomButton(onTap: _controller.searchAIImage, text: 'Create Image'),
        ],
      ),
    );
  }

  Widget _aiImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: switch (_controller.status.value) {
        Status.none => Lottie.asset(
            'assets/lottie/imagination.json',
            height: mq.height * 0.3,
            width: mq.width * 0.8,
            fit: BoxFit.cover,
          ),
        Status.complete => _controller.url.isNotEmpty
            ? Image.memory(
                _controller.url.first,
                fit: BoxFit.cover,
              )
            : const SizedBox(),
        Status.loading => const CustomLoading(),
      },
    );
  }
}
