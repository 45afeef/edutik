import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'assessment_widget.dart';

class UnSupportedAssessmentItemTypeWidget extends StatelessAssessmentWidget {
  UnSupportedAssessmentItemTypeWidget({super.key})
      : super(
          item: null,
          onResponse: (_) {},
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 200,
          height: 300,
          child: Center(
            child: Text(
              "lbl_unsupported_assessment_item".tr,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
