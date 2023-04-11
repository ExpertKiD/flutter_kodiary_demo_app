import 'package:app/core/widgets/atoms/failed_retry/failed_retry.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/injections/injections.dart';
import '../../../domain/usecases/get_projects_by_company_daily_request.dart';
import '../../bloc/projects/projects_bloc.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectsBloc(
        getProjectsByCompanyDailyRequestsUseCase:
            getIt<GetProjectsByCompanyDailyRequestsUseCase>(),
      )..add(ProjectsEvent.getProjectsByCompanyDailyRequests()),
      child: ScreenTypeLayout.builder(
        mobile: (mobileContext) => const HomeMobileWidget(),
        // tablet: (tabletContext) => const HomeTabletWidget(),
      ),
    );
  }
}
