import 'package:flutter/material.dart';
import 'package:get/get.dart';

int _initialPage = 0;

class HomeController extends GetxController {
  final RxInt currentPageIndex = _initialPage.obs;

  PageController tabsController = PageController(initialPage: _initialPage);
}
