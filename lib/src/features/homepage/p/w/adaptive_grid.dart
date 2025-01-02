import 'package:flutter/material.dart';

/// A widget that displays its children in an adaptive grid or list view layout based on screen width.
///
/// The layout adapts to different screen sizes:
/// - Single column for mobile devices (width < 600)
/// - Two columns for medium screens (600 <= width < 1200)
/// - Three columns for larger screens (width >= 1200)
class AdaptiveGridView extends StatelessWidget {
  /// Function to build a widget for a specific item index.
  final Widget Function(BuildContext context, int index)? itemBuilder;

  /// List of widgets to display in the grid or list.
  final List<Widget>? items;

  /// Number of items to display.
  final int? itemCount;

  /// Default constructor for a static list of widgets.
  const AdaptiveGridView({super.key})
      : items = null,
        itemBuilder = null,
        itemCount = null;

  /// Constructor for a builder-based adaptive grid view.
  const AdaptiveGridView.builder({
    required this.itemBuilder,
    required this.itemCount,
    super.key,
  }) : items = null;

  /// Constructor for a count-based adaptive grid view.
  const AdaptiveGridView.count({
    required this.items,
    super.key,
  })  : itemBuilder = null,
        itemCount = null;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return _buildListView();
        } else if (constraints.maxWidth < 1200) {
          return _buildGrid(2);
        } else {
          return _buildGrid(3);
        }
      },
    );
  }

  /// Builds a GridView with the specified number of columns.
  Widget _buildGrid(int columns) {
    if (items != null) {
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: 1,
        ),
        itemCount: items!.length,
        itemBuilder: (context, index) => items![index],
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: columns,
          childAspectRatio: 1,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder!,
      );
    }
  }

  /// Builds a ListView for mobile devices.
  Widget _buildListView() {
    if (items != null) {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items!.length,
        itemBuilder: (context, index) => items![index],
      );
    } else {
      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: itemCount,
        itemBuilder: itemBuilder!,
      );
    }
  }
}
