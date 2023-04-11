import 'package:app/core/entities/no_params.dart';
import 'package:app/core/failures/app_failures.dart';
import 'package:app/core/use_cases/use_case.dart';
import 'package:app/features/home/domain/entitites/projects_by_company_daily_request_response/projects_by_company_daily_request_response.dart';
import 'package:app/features/home/domain/repositories/project.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/constants/app_failure_messages.dart';

@lazySingleton
class GetProjectsByCompanyDailyRequestsUseCase extends UseCase<AppFailure,
    ProjectsByCompanyDailyRequestResponse, NoParams> {
  final InternetConnectionChecker connectionChecker;
  final ProjectRepository repository;

  GetProjectsByCompanyDailyRequestsUseCase({
    required this.connectionChecker,
    required this.repository,
  });

  @override
  Future<Either<AppFailure, ProjectsByCompanyDailyRequestResponse>> call(
      NoParams params) async {
    bool isConnected = await connectionChecker.hasConnection;

    if (!isConnected) {
      return Left(AppFailure.noInternetConnection(
          message: AppFailureMessages.kNoInternet));
    } else {
      return await repository.getProjects();
    }
  }
}
