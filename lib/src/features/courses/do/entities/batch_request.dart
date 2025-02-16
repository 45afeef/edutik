class BatchRequestEntity {
  final String? id;
  final String courseId;
  final String batchId;
  final String studentId;
  final BatchRequestStatus status;

  BatchRequestEntity({
    this.id,
    required this.courseId,
    required this.batchId,
    required this.studentId,
    required this.status,
  });
}

enum BatchRequestStatus { pending, accepted, rejected, none }
