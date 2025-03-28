import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../utils/database/database_service.dart';
import '../../../../../utils/database/firestore_service.dart';
import '../../../homepage/do/content.dart';
import '../../do/repositories/assessment_repository.dart';
import '../models/assessment_model.dart';

const String kAssessmentsTableName = _tableOrCollectionName;
const String _tableOrCollectionName = 'assessments';

class AssessmentRepositoryImpl implements AssessmentRepository {
  final DatabaseService databaseService;

  AssessmentRepositoryImpl(this.databaseService);

  // TODO - RETHINK
  // should I move the cache logic to here(assessment repository) from (assessement)controller
  // Now on 11th of Jan 2024, I feel like the cache logic should held in repository and not in controller.
  // If sanctioned, move all cache logic in various controllers to respective repositories.

  @override
  Future<void> create(AssessmentModel model) {
    final data = model.toJson();

    return databaseService.addData(
      collection: _tableOrCollectionName,
      data: data,
    );
  }

  @override
  Future<void> delete(String modelId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> incrementFieldCount({
    required String assessmentId,
    required String fieldName,
    int incrementBy = 1,
  }) async {
    assert(assessmentId.isNotEmpty, 'Assessment ID must not be empty');
    assert(['attemptsCount', 'submissionsCount'].contains(fieldName),
        'Field name must be either "attemptsCount" or "submissionsCount"');

    try {
      await databaseService.updateData(
        collection: '$_tableOrCollectionName/$assessmentId/analytics',
        documentId: 'basic',
        data: {
          fieldName: FieldValue.increment(incrementBy),
        },
      );
    } on FirebaseException catch (e) {
      // Handle any errors that may occur during the increment operation
      // If the document doesn't exist, create it with the initial value
      print('Error incrementing field count: $e');
      if (e.code == 'not-found') {
        // Document doesn't exist, create it with the initial value
        await (databaseService as FirebaseService).setData(
          collection: '$_tableOrCollectionName/$assessmentId/analytics',
          documentId: 'basic',
          data: {
            fieldName: FieldValue.increment(incrementBy),
          },
        );
      } else {
        rethrow; // Rethrow the error if it's not a "not-found" error
      }
    } finally {
      // Optionally, you can add any cleanup or finalization code here
      print('Field count incremented successfully');
    }
  }

  @override
  Future<List<AssessmentModel>> readAll(
    String ownerId, {
    UserType? ownerType,
    int limit = 5,
  }) async {
    var input = await databaseService.queryData(
      collection: _tableOrCollectionName,
      query: {'ownerRef': '${ownerType?.name}s/$ownerId'},
    );

    var output = input.map((e) => AssessmentModel.fromJson(e)).toList();

    return output;
  }

  @override
  Future<AssessmentModel> readOne(String modelId, {UserType? ownerType}) async {
    var input = await databaseService.getData(
      collection: _tableOrCollectionName,
      documentId: modelId,
    );

    return AssessmentModel.fromJson(input);
  }

  @override
  Future<void> update(String modelId, json) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
