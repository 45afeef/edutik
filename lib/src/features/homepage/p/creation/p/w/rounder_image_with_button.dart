import 'package:flutter/material.dart';

class RoundedImageWithButton extends StatelessWidget {
  final String cta;
  final String imageUrl;
  final void Function()? onPressed;

  const RoundedImageWithButton(
    this.cta,
    this.imageUrl, {
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Rounded corner image
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20), // Full width CTA button with white border
          ElevatedButton.icon(
            iconAlignment: IconAlignment.end,
            label: Text(cta),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50), // Full width
            ),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
