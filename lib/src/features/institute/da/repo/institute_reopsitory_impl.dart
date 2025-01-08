import '../../../../../utils/database/database_service.dart';
import '../../do/repo/institute_repo.dart';
import '../model/institute_model.dart';

class InstituteReopsitoryImpl extends InstituteRepository {
  final DatabaseService databaseService;

  InstituteReopsitoryImpl(this.databaseService);

  @override
  Future<InstituteModel> getInstitute(String instituteId) async {
    Map<String, dynamic> data = await databaseService.getData(
        collection: 'institutes', documentId: instituteId);

    return InstituteModel.fromJson(data);
  }
}
