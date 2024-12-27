import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../do/closed_ended/match_the_following.dart';
import 'assessment_widget.dart';

class Item extends StatelessWidget {
  final Color selectionColor;

  final String text;
  final ValueChanged<String> onSelection;
  const Item({
    super.key,
    required this.selectionColor,
    required this.text,
    required this.onSelection,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(selectionColor)),
        onPressed: () {
          onSelection(text);
        },
        child: Center(child: Text(text)),
      ),
    );
  }
}

class MatchTheFollowingWidget
    extends StatefulAssessmentWidget<MatchTheFollowing> {
  const MatchTheFollowingWidget({
    super.key,
    required super.item,
    required super.onResponse,
  });

  @override
  State<MatchTheFollowingWidget> createState() =>
      _MatchTheFollowingWidgetState();
}

class MtfItems extends StatelessWidget {
  final String place;

  final List<String> items;
  final List<Map<String, dynamic>> matchedItems;
  final ValueChanged<String> onSelection;
  final Color unSelectedColor;
  const MtfItems({
    super.key,
    required this.items,
    required this.onSelection,
    required this.matchedItems,
    required this.place,
    this.unSelectedColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...items.map((e) {
          Map<String, dynamic>? match = matchedItems.firstWhereOrNull(
            (element) => element[place] == e,
          );

          Color color = match?['color'] ?? unSelectedColor;
          return Item(
            selectionColor: color,
            text: e,
            onSelection: match == null ? onSelection : (_) {},
          );
        }),
      ],
    );
  }
}

class _MatchTheFollowingWidgetState extends State<MatchTheFollowingWidget> {
  List<Map<String, dynamic>> matchedItems =
      []; // Keys are - leftItem, rightItem, Color

  String? currentSelectedLeftItem;
  String? currentSelectedRightItem;

  final List<Color> selectedColors = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.cyan,
    Colors.pink,
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(widget.item.question),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Left side items
                  MtfItems(
                    place: 'left',
                    matchedItems: matchedItems,
                    items: widget.item.leftSideItems,
                    onSelection: (value) {
                      currentSelectedLeftItem = value;
                      matchItems();
                    },
                  ),
                  // Right side items
                  MtfItems(
                      place: 'right',
                      matchedItems: matchedItems,
                      items: widget.item.rightSideItems,
                      onSelection: (value) {
                        currentSelectedRightItem = value;
                        matchItems();
                      }),
                ],
              ),
            ),
            ElevatedButton(
                child: Center(child: Text('lbl_submit'.tr)),
                onPressed: () {
                  var answer = matchedItems
                      .where((a) => a['left'] != null && a['right'] != null)
                      .toList()
                      .fold({}, (a, b) {
                    a[b['left']] = b['right'];
                    return a;
                  });
                  widget.onResponse(answer);
                })
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    widget.item.leftSideItems.shuffle();
    widget.item.rightSideItems.shuffle();
  }

  void matchItems() {
    var color = selectedColors[0];

    var i = {
      'color': color,
      'left': currentSelectedLeftItem,
      'right': currentSelectedRightItem,
    };

    var match = matchedItems
        .firstWhereOrNull((e) => e['left'] == null || e['right'] == null);

    setState(() {
      if (match != null) {
        matchedItems.remove(match);
      }
      matchedItems.add(i);
    });

    if (currentSelectedLeftItem != null && currentSelectedRightItem != null) {
      selectedColors.removeAt(0);
      currentSelectedLeftItem = null;
      currentSelectedRightItem = null;
    }
  }
}
