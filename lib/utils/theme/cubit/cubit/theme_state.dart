part of 'theme_cubit.dart';

class ThemeState {
  const ThemeState({
    this.selectedThemeType = ThemeType.system,
    this.themeMode = ThemeMode.system,
  });

  final ThemeType selectedThemeType;
  final ThemeMode themeMode;

  ThemeState copyWith({
    ThemeType? selectedThemeType,
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      selectedThemeType: selectedThemeType ?? this.selectedThemeType,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  ThemeData get lightTheme {
    switch (selectedThemeType) {
      case ThemeType.system:
        return AppTheme.lightTheme;
    }
  }

  ThemeData get darkTheme {
    switch (selectedThemeType) {
      case ThemeType.system:
        return AppTheme.darkTheme;
    }
  }
}
