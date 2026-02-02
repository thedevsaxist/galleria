import 'package:auto_route/auto_route.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:galleria/core/routes/router.gr.dart';
import 'routes.dart';

part 'router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page|Bar,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType {
    return RouteType.custom(transitionsBuilder: TransitionsBuilders.noTransition);
  }

  @override
  List<AutoRoute> get routes => [AutoRoute(path: Routes.homeRoute, page: HomeRoute.page, initial: true)];
}

@riverpod
AppRouter appRouter(_) {
  return AppRouter();
}
