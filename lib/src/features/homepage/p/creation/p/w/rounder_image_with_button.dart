import 'package:flutter/material.dart';

class RoundedImageWithButton extends StatelessWidget {
  final String cta;
  final String imageUrl;
  final bool isAssetImage;
  final void Function()? onPressed;

  const RoundedImageWithButton(
    this.cta,
    this.imageUrl, {
    required this.onPressed,
    this.isAssetImage = false,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed != null ? 1 : 0.3,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Rounded corner image
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: isAssetImage
                  ? Image.asset(
                      imageUrl,
                      width: double.infinity,
                      height: onPressed != null ? 200 : 100,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: onPressed != null ? 200 : 100,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
                height: 20), // Full width CTA button with white border
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
      ),
    );
  }

  // Image grayscale(Image src) {
  //   var p = src.getBytes();
  //   for (var i = 0, len = p.length; i < len; i += 4) {
  //     var l = getLuminanceRgb(p[i], p[i + 1], p[i + 2]);
  //     p[i] = l;
  //     p[i + 1] = l;
  //     p[i + 2] = l;
  //   }
  //   return src;
  // }
}
