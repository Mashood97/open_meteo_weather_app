import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/favourite/favourite_cubit.dart';
import 'package:open_meteo_weather_app/utils/dependency_injection/di_container.dart';
import 'package:open_meteo_weather_app/utils/extensions/context_extensions.dart';
import 'package:open_meteo_weather_app/utils/extensions/string_extensions.dart';
import 'package:open_meteo_weather_app/utils/navigation/app_navigations.dart';
import 'package:open_meteo_weather_app/widget/error/app_error.dart';
import 'package:open_meteo_weather_app/widget/loader/app_loader.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late FavouriteCubit favouriteCubit;

  @override
  void initState() {
    super.initState();
    favouriteCubit = getItInstance.get<FavouriteCubit>();
    favouriteCubit.fetchFavourites();
  }

  @override
  void dispose() {
    favouriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark'),
      ),
      body: SafeArea(
        child: BlocProvider.value(
          value: favouriteCubit,
          child: BlocConsumer<FavouriteCubit, FavouriteState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FavouriteLoading) {
                return const AppLoader();
              }
              return state.getFavourites.isEmpty
                  ? const AppError()
                  : ListView.separated(
                      itemBuilder: (ctx, index) => ListTile(
                        onTap: () {
                          AppNavigations()
                              .navigateFromWeatherPageToWeatherDetailsPage(
                                  context: ctx,
                                  latitude: double.parse(
                                    state.getFavourites[index]['latitude']
                                        .toString(),
                                  ),
                                  longitude: double.parse(
                                    state.getFavourites[index]['longitude']
                                        .toString(),
                                  ),
                                  countryName: state.getFavourites[index]
                                      ['countryName'] as String,
                                  cityName: state.getFavourites[index]
                                      ['cityName'] as String,
                                  weatherId: int.parse(
                                    state.getFavourites[index]['weatherId']
                                        .toString(),
                                  ),
                                  isFromBookMark: true);
                        },
                        title: state.getFavourites[index]['countryName']
                                    .toString()
                                    .isTextNullAndEmpty ==
                                true
                            ? const SizedBox()
                            : Text(
                                state.getFavourites[index]['countryName']
                                    .toString(),
                                style: context.theme.textTheme?.titleLarge
                                    ?.copyWith(color: const Color(0xFFF2F2F2)),
                              ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                        subtitle: state.getFavourites[index]['cityName']
                                    .toString()
                                    .isTextNullAndEmpty ==
                                true
                            ? const SizedBox()
                            : Text(
                                state.getFavourites[index]['cityName']
                                    .toString(),
                                style: context.theme.textTheme?.titleMedium
                                    ?.copyWith(color: Colors.grey),
                              ),
                      ),
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: state.getFavourites.length,
                    );
            },
          ),
        ),
      ),
    );
  }
}
