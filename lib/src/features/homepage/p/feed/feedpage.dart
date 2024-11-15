import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p/controller.dart';
import 'p/shorts_page.dart';

class FeedPage extends GetWidget<FeedController> {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShortsPage(shorts: controller.shorts_list);
  }
}
