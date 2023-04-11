import 'package:app/features/home/domain/entitites/projects_by_company_daily_request_response/projects_by_company_daily_request_response.dart';

abstract class ProjectRemoteDataSource {
  Future<ProjectsByCompanyDailyRequestResponse> getProjects();
}
