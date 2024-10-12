import 'package:edukit/src/widgets/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/theme/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());

    return Layout(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hello".tr),
            IconButton(
                onPressed: themeController.toggleTheme,
                icon: const Icon(Icons.brightness_4_rounded)),
          ],
        ),
      ),
    );
  }
}
