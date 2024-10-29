import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/manager/fetch_country_lat_lng_bloc.dart';
import 'package:open_meteo_weather_app/features/weather/presentation/widgets/weather_country_lat_lng_list_item.dart';
import 'package:open_meteo_weather_app/utils/constant/app_constant.dart';
import 'package:open_meteo_weather_app/utils/constant/app_snackbar.dart';
import 'package:open_meteo_weather_app/utils/dependency_injection/di_container.dart';
import 'package:open_meteo_weather_app/utils/navigation/app_navigations.dart';
import 'package:open_meteo_weather_app/widget/error/app_error.dart';
import 'package:open_meteo_weather_app/widget/loader/app_loader.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late FetchCountryLatLngBloc fetchCountryLatLngBloc;
  final TextEditingController searchTextEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchCountryLatLngBloc = getItInstance.get<FetchCountryLatLngBloc>();
  }

  @override
  void dispose() {
    _formKey.currentState?.reset();
    fetchCountryLatLngBloc.close();
    searchTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Weather',
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppNavigations().navigateToBookmarkPage(context: context);
            },
            tooltip: 'Goto bookmark page',
            icon: const Icon(
              Icons.bookmark,
            ),
          ).animate().fade(delay: 350.ms),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppConstant.kAppSidePadding,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: searchTextEditingController,
                        validator: (val) => val?.isEmpty == true
                            ? 'Please enter country name'
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Search',
                          hintText: 'Search by country',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        fetchCountryLatLngBloc.add(
                          OnFetchCountryLatLngEvent(
                            countryName:
                                searchTextEditingController.text.trim(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Search',
                    ),
                  ),
                ],
              ).animate().fade(delay: 300.ms),
              const SizedBox(
                height: 14,
              ),
              Expanded(
                child: BlocProvider.value(
                  value: fetchCountryLatLngBloc,
                  child: BlocConsumer<FetchCountryLatLngBloc,
                      FetchCountryLatLngState>(
                    listener: (ctx, state) {
                      if (state is FetchCountryLatLngFailure) {
                        AppSnackBar().showErrorSnackBar(
                          context: ctx,
                          error: state.errorMessage,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is FetchCountryLatLngLoading) {
                        return const AppLoader();
                      }

                      if (state is FetchCountryLatLngFailure) {
                        return AppError(
                          errorMessage: state.errorMessage,
                        );
                      }
                      return state.items.isEmpty
                          ? const AppError(
                        errorMessage: 'No Location Found',
                      )
                          : ListView.separated(
                              itemBuilder: (BuildContext ctx, int index) =>
                                  WeatherCountryLatLngListItem(
                                countryLatLngResponseEntity: state.items[index],
                              ),
                              separatorBuilder: (_, __) => const Divider(),
                              itemCount: state.items.length,
                            ).animate().fade(delay: 500.ms);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
