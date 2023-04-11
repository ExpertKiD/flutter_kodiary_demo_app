import 'package:app/core/failures/app_failures.dart';
import 'package:app/features/home/data/datasources/project_remote.dart';
import 'package:app/features/home/domain/entitites/projects_by_company_daily_request_response/projects_by_company_daily_request_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../domain/repositories/project.dart';

@LazySingleton(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<AppFailure, ProjectsByCompanyDailyRequestResponse>>
      getProjects() async {
    try {
      return Right(await remoteDataSource.getProjects());
    } on AppException catch (exception) {
      return Left(AppFailure.fromException(exception));
    }
  }
}
