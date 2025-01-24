import 'package:flutter/material.dart';

class EmptyItem extends StatelessWidget {
  final String itemName;
  final String message;
  final String imageUrl;

  const EmptyItem({
    super.key,
    this.itemName = 'item',
    this.message = 'Oops! Looks like there are no items here.',
    this.imageUrl =
        'https://img.icons8.com/?size=256w&id=myNNj6E9OAZ7&format=png',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            height: 200.0, // Adjust the height as needed
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            'No $itemName available',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
