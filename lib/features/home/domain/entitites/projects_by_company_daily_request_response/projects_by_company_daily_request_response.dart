import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_by_company_daily_request_response.freezed.dart';
part 'projects_by_company_daily_request_response.g.dart';

@freezed
class ProjectsByCompanyDailyRequestResponse
    with _$ProjectsByCompanyDailyRequestResponse {
  factory ProjectsByCompanyDailyRequestResponse({
    required String message,
  }) = _ProjectsByCompanyDailyRequestResponse;

  factory ProjectsByCompanyDailyRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProjectsByCompanyDailyRequestResponseFromJson(json);
}
