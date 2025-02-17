import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_meteo_weather_app/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
