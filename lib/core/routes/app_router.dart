import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/home/domain/entitites/coords/coords.dart';
import '../../features/home/presentation/widgets/pages/home.dart';
import '../../features/home/presentation/widgets/pages/maps/maps.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/'),
        AutoRoute(page: MapsRoute.page),
      ];
}
