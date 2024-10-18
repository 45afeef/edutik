import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'shorts_page.dart';

class FeedPage extends GetWidget<FeedController> {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShortsPage();
  }
}
