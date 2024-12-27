import 'package:flutter/material.dart';

abstract class AssessmentWidget<T> extends Widget {
  const AssessmentWidget({
    super.key,
    required this.item,
    required this.onResponse,
  });

  /// The AssessmentItem
  final T item;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final void Function(dynamic) onResponse;
}

abstract class StatelessAssessmentWidget<T> extends StatelessWidget
    implements AssessmentWidget {
  const StatelessAssessmentWidget({
    super.key,
    required this.item,
    required this.onResponse,
  });

  /// The AssessemntItem
  @override
  final T item;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  @override
  final void Function(dynamic) onResponse;
}

abstract class StatefulAssessmentWidget<T> extends StatefulWidget
    implements AssessmentWidget {
  const StatefulAssessmentWidget({
    super.key,
    required this.item,
    required this.onResponse,
  });

  /// The AssessemntItem
  @override
  final T item;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  @override
  final void Function(dynamic) onResponse;
}
