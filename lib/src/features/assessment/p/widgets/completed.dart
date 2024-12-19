import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedWidget extends StatelessWidget {
  final Function() onComplete;

  const CompletedWidget({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('lbl_assessment_end_screen'.tr),
              const Divider(),
              Text('lbl_do_you_want_to_submit'.tr),
              ElevatedButton(
                onPressed: onComplete,
                child: Text(
                  'lbl_submit'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
