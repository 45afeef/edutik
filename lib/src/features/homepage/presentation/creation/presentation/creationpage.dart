import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CreationPage extends GetWidget<CreationController> {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              controller;
            },
          ),
          const SizedBox(height: 10),
          Text("lbl_create".tr),
          Text("EduTik", style: Get.textTheme.bodyLarge)
        ],
      ),
    );
  }
}
