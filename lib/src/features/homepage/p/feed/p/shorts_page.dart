import 'package:flutter/material.dart';

import '../../../do/shorts_entity.dart';
import '../w/shorts_view_widget.dart';

class ShortsPage extends StatelessWidget {
  const ShortsPage({
    super.key,
    required this.shorts,
  });

  final List<ShortsEntity> shorts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: shorts.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ShortView(
            data: shorts[index],
          );
        },
      ),
    );
  }
}
