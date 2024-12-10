import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UpcomingFeature extends StatelessWidget {
  final String? imageUrl;
  final String? excerpt;
  final String featureName;

  const UpcomingFeature({
    super.key,
    this.imageUrl,
    this.excerpt,
    this.featureName = '',
  });

  @override
  Widget build(BuildContext context) {
    // Default values
    final List<String> defaultSvgs = [
      'assets/images/audio_conversation.svg',
      'assets/images/educator.svg',
      'assets/images/favourite_item.svg',
      'assets/images/team_effort.svg',
    ];

    final List<String> defaultExcerpts = [
      'Something exciting is on the way!',
      'Stay tuned for an amazing new feature.',
    ];

    final randomImage = (defaultSvgs..shuffle()).first;
    final randomExcerpt = (defaultExcerpts..shuffle()).first;

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AspectRatio(
            aspectRatio: 2,
            child: (imageUrl != null)
                ? Image.network(imageUrl!)
                : SvgPicture.asset(randomImage),
          ),
          const SizedBox(height: 10),
          Text(
            featureName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            excerpt != null ? excerpt! : randomExcerpt,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'This feature is currently under construction. We are working hard to bring it to you soon!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
