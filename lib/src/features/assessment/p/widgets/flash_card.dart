import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../do/closed_ended/flashcard.dart';
import 'assessment_widget.dart';

class FlashCardWidget extends StatelessAssessmentWidget<FlashCard> {
  FlashCardWidget({
    super.key,
    required super.item,
    required void Function(bool) onResponse,
  }) : super(onResponse: (b) => onResponse(b));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: FlipCard(
        front: Card(
          color: Colors.red,
          child: Center(child: Text(item.question)),
        ),
        back: Stack(
          children: [
            Card(
              color: Colors.amber,
              child: Center(
                child: Text(item.explanation),
              ),
            ),
            Positioned(
              bottom: 10,
              width: 300,
              child: OverflowBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => onResponse(true),
                    child: Text('lbl_yes'.tr),
                  ),
                  ElevatedButton(
                    onPressed: () => onResponse(false),
                    child: Text("lbl_no".tr),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
