part of 'projects_bloc.dart';

@freezed
class ProjectsState with _$ProjectsState {
  factory ProjectsState.initial() = _Initial;

  factory ProjectsState.loading() = _Loading;

  factory ProjectsState.loaded({
    required ProjectsByCompanyDailyRequestResponse response,
  }) = _Loaded;

  factory ProjectsState.loadFailure({
    required AppFailure failure,
  }) = _LoadFailure;
}
