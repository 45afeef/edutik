import 'package:flutter/material.dart';

class ExamGrid extends StatelessWidget {
  const ExamGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      shrinkWrap: true,
      // Create a grid with 3 columns. If you change the scrollDirection to
      crossAxisCount: 3,
      // Generate 18 widgets that display their index in the List with different backgrounds.
      children: Colors.primaries.map((color) {
        return Container(
          color: color,
          height: 150.0,
          child: Center(
            child: Text(
              'Item ${Colors.primaries.indexOf(color)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        );
      }).toList(),
    );
  }
}
