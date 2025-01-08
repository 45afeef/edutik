import '../../da/model/institute_model.dart';

abstract class InstituteRepository {
  Future<InstituteModel> getInstitute(String instituteId);
}
