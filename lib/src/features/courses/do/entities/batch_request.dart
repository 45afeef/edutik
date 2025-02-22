class BatchRequestEntity {
  final String? id;
  final String courseId;
  final String batchId;
  final String studentId;
  final String? studentName; // Added studentName
  BatchRequestStatus status;

  BatchRequestEntity({
    this.id,
    required this.courseId,
    required this.batchId,
    required this.studentId,
    // This will help to reduce the number of queries to get the student name
    // Helps in reducing the cost 
    this.studentName, // Added studentName
    required this.status,
  });
}

enum BatchRequestStatus { pending, accepted, rejected, none }
