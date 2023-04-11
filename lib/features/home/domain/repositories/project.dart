import 'package:app/core/failures/app_failures.dart';
import 'package:app/features/home/domain/entitites/projects_by_company_daily_request_response/projects_by_company_daily_request_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProjectRepository {
  Future<Either<AppFailure, ProjectsByCompanyDailyRequestResponse>>
      getProjects();
}
