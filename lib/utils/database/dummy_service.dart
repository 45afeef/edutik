import 'dart:convert';

import 'package:flutter/services.dart';

import '../../src/features/homepage/da/shorts_model.dart';
import '../../src/features/homepage/do/shorts_entity.dart';
import 'database_service.dart';

class DummyService extends DatabaseService {
  @override
  Future<void> addData(
      {required String collection, required Map<String, dynamic> data}) {
    // TODO: implement addData
    throw UnimplementedError();
  }

  @override
  Future<void> deleteData(
      {required String collection, required String documentId}) {
    // TODO: implement deleteData
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAllData(
      {required String collection}) async {
    switch (collection) {
      case 'shorts':
        return [
          ...[
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
          ].map((e) => e.toJson())
        ];
      case 'assessments':
        var assessment =
            await getData(collection: 'assessments', documentId: '1');
        return List.generate(50, (i) => assessment);
      default:
        // TODO: implement deleteData
        throw UnimplementedError();
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String collection,
    required String documentId,
  }) async {
    switch (collection) {
      case 'assessments':
        final input =
            await rootBundle.loadString('assets/dummy_assessment.json');

        Future.delayed(const Duration(seconds: 30));
        return jsonDecode(input);
      default:
    }
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<void> updateData(
      {required String collection,
      required String documentId,
      required Map<String, dynamic> data}) {
    // TODO: implement updateData
    throw UnimplementedError();
  }
  
  @override
  Future<List<Map<String, dynamic>>> queryData({required String collection, required Map<String, dynamic> query}) {
    // TODO: implement queryData
    throw UnimplementedError();
  }
}
