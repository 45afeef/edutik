import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../do/open_ended/one_word.dart';
import 'assessment_widget.dart';

class OneWordQuestionWidget extends StatelessAssessmentWidget<OneWordQuestion> {
  OneWordQuestionWidget({
    super.key,
    required super.item,
    required void Function(String) onResponse,
  }) : super(onResponse: (s) => onResponse(s));

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.question),
          const Divider(),
          TextField(controller: controller),
          ElevatedButton(
              child: Text('lbl_submit'.tr),
              onPressed: () => onResponse(controller.text))
        ],
      ),
    ));
  }
}
