import 'package:app/core/entities/no_params.dart';
import 'package:app/core/failures/app_failures.dart';
import 'package:app/features/home/domain/entitites/projects_by_company_daily_request_response/projects_by_company_daily_request_response.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/usecases/get_projects_by_company_daily_request.dart';

part 'projects_bloc.freezed.dart';
part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjectsByCompanyDailyRequestsUseCase
      getProjectsByCompanyDailyRequestsUseCase;

  ProjectsBloc({
    required this.getProjectsByCompanyDailyRequestsUseCase,
  }) : super(ProjectsState.initial()) {
    on<_ProjectsEventGetProjectsByCompanyDailyRequests>(
        _onProjectsEventGetProjectsByCompanyDailyRequests);
  }

  void _onProjectsEventGetProjectsByCompanyDailyRequests(
    _ProjectsEventGetProjectsByCompanyDailyRequests event,
    Emitter<ProjectsState> emit,
  ) async {
    emit(ProjectsState.loading());

    final result = await getProjectsByCompanyDailyRequestsUseCase(NoParams());

    result.fold((failure) {
      emit(ProjectsState.loadFailure(failure: failure));
    }, (response) {
      emit(ProjectsState.loaded(response: response));
    });
  }
}
