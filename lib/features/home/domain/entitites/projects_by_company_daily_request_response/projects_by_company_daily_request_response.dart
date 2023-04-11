// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../projects_by_company_daily_request/projects_by_company_daily_request.dart';

part 'projects_by_company_daily_request_response.freezed.dart';
part 'projects_by_company_daily_request_response.g.dart';

@freezed
class ProjectsByCompanyDailyRequestResponse
    with _$ProjectsByCompanyDailyRequestResponse {
  factory ProjectsByCompanyDailyRequestResponse({
    required String message,
    @JsonKey(name: 'data')
    @Default(<ProjectsByCompanyDailyRequest>[])
        List<ProjectsByCompanyDailyRequest> projects,
  }) = _ProjectsByCompanyDailyRequestResponse;

  factory ProjectsByCompanyDailyRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ProjectsByCompanyDailyRequestResponseFromJson(json);
}
