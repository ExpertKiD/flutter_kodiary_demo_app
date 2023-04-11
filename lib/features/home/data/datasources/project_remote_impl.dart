import 'package:app/core/constants/app_failure_messages.dart';
import 'package:app/core/exceptions/app_exceptions.dart';
import 'package:app/core/utils/dio_error_handler.dart';
import 'package:app/features/home/data/datasources/project_remote.dart';
import 'package:app/features/home/domain/entitites/projects_by_company_daily_request_response/projects_by_company_daily_request_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProjectRemoteDataSource)
class ProjectRemoteDataSourceImpl extends ProjectRemoteDataSource {
  static const String kBearerToken =
      'eJx9jsEKwjAQRH+l5CylNdJWT178AYvnsjSxDSbZkqRKLf13k4BWENzL7gzLm5nJaLkhh2QmgvlFNwlpkXF/kkt9OmdhKPGuBhVdOyrQwRh61MHRo5RecgVCfh6ON2QCzJS2qMgSoWoAPa1J2y9m/Wb+gfwmSuxwVdC2fHBND08wTOBomwdYF96vIC0PFcDxDk3oQO5cMzSxmROxRF5Ueb7PaJGllO7KslpeiqxWwA==';
  final Dio dio;

  ProjectRemoteDataSourceImpl({
    required this.dio,
  });

  Future<ProjectsByCompanyDailyRequestResponse> getProjects() async {
    try {
      final response = await dio.get(
          'https://gateway.cronlink.ca/api/v1/project/company-daily-requests?period=2023-03-01+05:45:00,2023-04-23+05:45:00',
          options: Options(
            headers: {
              "Authorization": "Bearer $kBearerToken",
            },
          ));

      return ProjectsByCompanyDailyRequestResponse.fromJson(
          response.data as Map<String, dynamic>);
    } on DioError catch (dioError) {
      throw DioErrorHandler.handle(dioError: dioError);
    } catch (e, trace) {
      print(e);
      print(trace);

      throw AppException.unknownException(
          message: AppFailureMessages.kUnknownError);
    }
  }
}
