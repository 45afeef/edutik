import 'package:flutter/material.dart';

import 'domain/shorts_data.dart';
import 'widgets/shorts_view_widget.dart';

class ShortsPage extends StatelessWidget {
  final List<ShortsData> shortsData = [
    ShortsData(
      creatorProfile: 'https://via.placeholder.com/150',
      creatorName: 'John Doe',
      description:
          'Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.',
      title: 'Sunset Wayanad',
      videoSource: VideoSource.youTube,
      videoUrl: 'BeS1yfqMW50',
      likes: 1234,
      views: 5678,
    ),
    ShortsData(
      creatorProfile: 'https://via.placeholder.com/150',
      creatorName: 'John Doe',
      description:
          'Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.',
      title: 'Sunset Wayanad',
      videoUrl: 'z3TcLFax-mA',
      videoSource: VideoSource.youTube,
      likes: 1234,
      views: 5678,
    ),
    ShortsData(
      creatorProfile: 'https://via.placeholder.com/150',
      creatorName: 'John Doe',
      description:
          'Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.',
      title: 'Sunset Wayanad',
      videoUrl: 'z3TcLFax-mA',
      videoSource: VideoSource.youTube,
      likes: 1234,
      views: 5678,
    ),
    ShortsData(
      creatorProfile: 'https://via.placeholder.com/150',
      creatorName: 'John Doe',
      description:
          'Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.',
      title: 'Sunset Wayanad',
      videoUrl: 'YTLlpXDmh5o',
      videoSource: VideoSource.youTube,
      likes: 1234,
      views: 5678,
    ),
    ShortsData(
      creatorProfile: 'https://via.placeholder.com/150',
      creatorName: 'John Doe',
      description:
          'Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.',
      title: 'Sunset Wayanad',
      videoUrl: 'm9xHmsS7XGw',
      videoSource: VideoSource.youTube,
      likes: 1234,
      views: 5678,
    ),
    ShortsData(
      creatorProfile: 'https://via.placeholder.com/150',
      creatorName: 'John Doe',
      description:
          'Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.Beautiful sunset in Wayanad! You’ll love the scenic views and peaceful environment. A perfect getaway to relax and unwind.',
      title: 'Sunset Wayanad',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      videoSource: VideoSource.network,
      likes: 1234,
      views: 5678,
    ),
    // Add more data here
  ];

  ShortsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: shortsData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ShortView(
            data: shortsData[index],
          );
        },
      ),
    );
  }
}
