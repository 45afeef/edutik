import '../../shorts_model.dart';
import '../../../do/repo/shorts_repo.dart';
import '../../../do/shorts_entity.dart';

class DummyShortsRepository implements ShortsRepository {
  @override
  Future<void> deleteShorts(String id) {
    // TODO: implement deleteShorts
    throw UnimplementedError();
  }

  @override
  Future<List<ShortsModel>> fetchAllShorts() async {
    // TODO - INVETIGATE THIS - uncommenting this line result in non-refresing of the content
    // await Future.delayed(const Duration(seconds: 2));

    return [
      ShortsModel(
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
      ShortsModel(
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
      ShortsModel(
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
      ShortsModel(
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
      ShortsModel(
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
      ShortsModel(
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
  }

  @override
  Future<ShortsModel> fetchShorts(String id) {
    // TODO: implement getShorts
    throw UnimplementedError();
  }

  @override
  Future<void> saveShorts(ShortsModel shorts) {
    // TODO: implement saveShorts
    throw UnimplementedError();
  }
}
