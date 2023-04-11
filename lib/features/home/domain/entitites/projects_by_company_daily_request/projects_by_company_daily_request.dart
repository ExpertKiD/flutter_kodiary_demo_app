// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../project/project.dart';
import '../request/request.dart';

part 'projects_by_company_daily_request.freezed.dart';
part 'projects_by_company_daily_request.g.dart';

@freezed
class ProjectsByCompanyDailyRequest with _$ProjectsByCompanyDailyRequest {
  factory ProjectsByCompanyDailyRequest({
    required int id,
    @JsonKey(name: 'company_request_id') required int companyRequestId,
    @JsonKey(name: 'company_id') required int companyId,
    @JsonKey(name: 'project_id') required int projectId,
    required String title,
    required String code,
    required bool allDay,
    required String color,
    required DateTime start,
    required DateTime end,
    required Project project,
    @JsonKey(name: 'request_date') required DateTime requestDate,
    required bool engagement,
    required List<Request> request,
  }) = _ProjectsByCompanyDailyRequest;

  factory ProjectsByCompanyDailyRequest.fromJson(Map<String, dynamic> json) =>
      _$ProjectsByCompanyDailyRequestFromJson(json);
}
