import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../do/closed_ended/mcq.dart';
import 'assessment_widget.dart';

class MCQWidget extends StatelessAssessmentWidget<MCQ> {
  final String? selectedAnswer;

  MCQWidget({
    super.key,
    required super.item,
    required void Function(String) onResponse,
    this.selectedAnswer,
  }) : super(onResponse: (s) => onResponse(s));

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(item.question),
          ),
        ).animate(delay: 400.microseconds).fade().slideX(),

        // Options
        ...item.options.asMap().entries.map(
              (e) => Card(
                color: selectedAnswer == e.value ? Colors.pink : null,
                child: InkWell(
                  onTap: () => onResponse(e.value),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(e.value),
                  ),
                ),
              )
                  .animate(delay: Duration(milliseconds: e.key * 300 + 500))
                  .fade()
                  .scale(begin: const Offset(1.1, 1.1))
                  .slideY(begin: 1),
            ),
      ],
    );
  }
}
