import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_meteo_weather_app/utils/dependency_injection/di_container.dart';
import 'package:open_meteo_weather_app/utils/internet_checker/network_bloc.dart';
import 'package:open_meteo_weather_app/utils/internet_checker/network_event.dart';
import 'package:open_meteo_weather_app/utils/navigation/go_router_navigation_delegate.dart';
import 'package:open_meteo_weather_app/utils/theme/cubit/cubit/theme_cubit.dart';

final _router = GoRouterNavigationDelegate();

final internetConnection = getItInstance.get<NetworkBloc>();

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeCubit themeCubit;

  @override
  void initState() {
    super.initState();
    themeCubit = getItInstance.get<ThemeCubit>();
    internetConnection.add(NetworkObserve());
  }

  @override
  void dispose() {
    themeCubit.close();
    internetConnection.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: themeCubit,
        ),
        BlocProvider.value(
         value:internetConnection
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Open Meteo Weather App',
            themeMode: state.themeMode,
            theme: state.lightTheme,
            darkTheme: state.darkTheme,
            routerConfig: _router.router,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
