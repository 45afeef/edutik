import 'package:get/get.dart';

import '../../../do/shorts_entity.dart';

class FeedController extends GetxController {
  // Define the necessary variables and methods for the feed page

  final RxList<ShortsEntity> shorts_list = <ShortsEntity>[].obs;

  void loadFeed() {
    // Logic to load feed items
    shorts_list.assignAll([
      ShortsEntity(
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
      ShortsEntity(
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
      ShortsEntity(
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
      ShortsEntity(
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
      ShortsEntity(
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
      ShortsEntity(
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
    ]);
  }

  void refreshFeed() {
    // Logic to refresh the feed
    loadFeed();
  }

  @override
  void onInit() {
    super.onInit();
    loadFeed();
  }
}
