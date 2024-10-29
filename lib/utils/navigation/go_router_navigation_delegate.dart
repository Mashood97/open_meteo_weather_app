import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_meteo_weather_app/features/weather/domain/entities/response/country_lat_lng_response_entity.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/pages/bookmark_page.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/pages/weather_details_page.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/pages/weather_page.dart';
import 'package:open_meteo_weather_app/utils/extensions/string_extensions.dart';
import 'package:open_meteo_weather_app/utils/navigation/route_names.dart';

class GoRouterNavigationDelegate {
  factory GoRouterNavigationDelegate() {
    return _singleton;
  }

  GoRouterNavigationDelegate._internal();

  static final GoRouterNavigationDelegate _singleton =
      GoRouterNavigationDelegate._internal();

  final parentNavigationKey = GlobalKey<NavigatorState>();
  late final GoRouter router = GoRouter(
    navigatorKey: parentNavigationKey,
    debugLogDiagnostics: true,
    redirect: (ctx, state) async {
      return null;
    },
    initialLocation: NavigationRouteNames.initialRoute,
    routes: [
      GoRoute(
        parentNavigatorKey: parentNavigationKey,
        path: NavigationRouteNames.initialRoute,
        name: NavigationRouteNames.initialRoute,
        builder: (BuildContext ctx, GoRouterState state) => const WeatherPage(),
        routes: [
          //
          GoRoute(
              path: NavigationRouteNames
                  .weatherDetailsPage.convertRoutePathToRouteName,
              name: NavigationRouteNames
                  .weatherDetailsPage.convertRoutePathToRouteName,
              pageBuilder: (BuildContext ctx, GoRouterState state) {
                final routeItem = state.uri.queryParameters;
                return MaterialPage(
                  fullscreenDialog: true,
                  child: WeatherDetailsPage(
                    queryParams: routeItem,
                  ),
                );
              }),
        ],
      ),
      GoRoute(
          path: NavigationRouteNames.bookmarkPage,
          name: NavigationRouteNames
              .bookmarkPage.convertRoutePathToRouteName,
          pageBuilder: (BuildContext ctx, GoRouterState state) {
            return const MaterialPage(
              fullscreenDialog: true,
              child: BookmarkPage(),
            );
          }),
    ],
  );
}
