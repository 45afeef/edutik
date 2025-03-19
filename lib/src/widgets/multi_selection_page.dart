import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultiSelectionPage<T> extends StatefulWidget {
  final List<T> items;
  final String title;
  final Widget Function(T item, bool isSelected) itemBuilder;
  final String? searchHint;
  final bool Function(T item, String query)? searchPredicate;

  const MultiSelectionPage({
    super.key,
    required this.items,
    required this.title,
    required this.itemBuilder,
    this.searchHint,
    this.searchPredicate,
  });

  @override
  State<MultiSelectionPage<T>> createState() => _MultiSelectionPageState<T>();
}

class _MultiSelectionPageState<T> extends State<MultiSelectionPage<T>> {
  final Set<T> _selectedItems = {};
  String _searchQuery = '';

  List<T> get _filteredItems {
    if (_searchQuery.isEmpty || widget.searchPredicate == null) {
      return widget.items;
    }
    return widget.items
        .where((item) => widget.searchPredicate!(item, _searchQuery))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: _selectedItems.toList()),
            child: const Text('Done'),
          ),
        ],
      ),
      body: Column(
        children: [
          if (widget.searchPredicate != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: widget.searchHint ?? 'Search...',
                  prefixIcon: const Icon(Icons.search),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                final isSelected = _selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedItems.remove(item);
                      } else {
                        _selectedItems.add(item);
                      }
                    });
                  },
                  child: widget.itemBuilder(item, isSelected),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
