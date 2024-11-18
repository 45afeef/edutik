import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p/controller.dart';
import 'p/w/shorts_creation_widget.dart';

class CreationPage extends GetWidget<CreationController> {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.isCreating) return _buildIntentionScreen();
        return _buildCreationScreen();
      },
    );
  }

  Widget _buildIntentionScreen() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton.outlined(
            icon: const Icon(Icons.add),
            enableFeedback: true,
            tooltip: "lbl_create".tr,
            padding: const EdgeInsets.all(24),
            iconSize: 24.0,
            splashRadius: 28.0,
            constraints: const BoxConstraints(),
            alignment: Alignment.center,
            onPressed: () {
              controller.isCreating = true;
            },
          ),
          const SizedBox(height: 10),
          Text("lbl_create".tr),
          Text("EduTik", style: Get.textTheme.bodyLarge)
        ],
      ),
    );
  }

  Widget _buildCreationScreen() {
    return ShortsCreationWidget(
      onSubmit: (title, description, videoUrl, videoSource) {
        controller.updateTitleDescriptionVideourlAndType(
            title, description, videoUrl, videoSource);
        controller.submitCreation();
      },
    );
  }
}
