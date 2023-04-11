part of 'projects_bloc.dart';

@freezed
class ProjectsEvent with _$ProjectsEvent {
  factory ProjectsEvent.getProjectsByCompanyDailyRequests() =
      _ProjectsEventGetProjectsByCompanyDailyRequests;
}
