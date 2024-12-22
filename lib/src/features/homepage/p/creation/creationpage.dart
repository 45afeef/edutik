import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p/creation_controller.dart';
import 'p/w/rounder_image_with_button.dart';
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

  Widget _buildCreationScreen() {
    return ShortsCreationWidget(
      onSubmit: (title, description, videoUrl, videoSource) {
        controller.updateTitleDescriptionVideourlAndType(
            title, description, videoUrl, videoSource);
        controller.submitCreation();
      },
    );
  }

  Widget _buildIntentionScreen() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          RoundedImageWithButton(
            'Create Exam',
            'https://cdn.dribbble.com/userupload/8649959/file/original-9c6c904f1a4c04b2ecf4eff7e1a22e4f.png?resize=752x&vertical=center',
            onPressed: () {},
          ),
          RoundedImageWithButton(
            'Create Shorts',
            'https://th.bing.com/th/id/OIP.FS6YltTUtgofukeesFx21AHaHa?w=610&h=610&rs=1&pid=ImgDetMain',
            onPressed: () => controller.isCreating = true,
          ),
          const RoundedImageWithButton(
            'Create New Batch',
            'assets/images/school_batches.png',
            isAssetImage: true,
            onPressed: null,
          ),
          const RoundedImageWithButton(
            'Create Video Class',
            'https://th.bing.com/th/id/OIP.obLEgRLmdz9aDxstTuWd5AHaE7?rs=1&pid=ImgDetMain',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
