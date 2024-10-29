import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  AppLocalStorage({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  final _favouriteKey = 'bookmark_detail_key';

  Future<void> markAsFavourite({required dynamic item}) async {
    await sharedPreferences.setString(
      _favouriteKey,
      json.encode(
        item,
      ),
    );
  }

  dynamic getFavouriteData() {
    return json.decode(sharedPreferences.getString(_favouriteKey) ?? '[]');
  }
}
