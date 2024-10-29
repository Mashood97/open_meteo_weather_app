import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_meteo_weather_app/utils/extensions/context_extensions.dart';

class GetWeatherForecastCardItem extends StatelessWidget {
  const GetWeatherForecastCardItem({
    required this.icon,
    required this.title,
    super.key,
  });

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 50,
            width: 50,
            color: context.theme.colorScheme.primary,
          ).animate().fade(delay: 800.ms),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ).animate().fade(delay: 1000.ms),
        ],
      ),
    ).animate().fade(delay: 400.ms);
  }
}
