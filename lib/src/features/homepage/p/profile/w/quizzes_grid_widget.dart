import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/routes.dart';

class QuizzesGrid extends StatelessWidget {
  const QuizzesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      crossAxisCount: 3,
      children: Colors.primaries.map((color) {
        return InkWell(
          onTap: () {
            Get.toNamed(AppRoute.assessmentScreen);
          },
          child: Container(
            color: color,
            height: 150.0,
            child: Center(
              child: Text(
                'Item ${Colors.primaries.indexOf(color)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
