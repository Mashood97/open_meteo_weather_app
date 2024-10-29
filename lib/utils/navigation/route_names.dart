class NavigationRouteNames {

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory NavigationRouteNames() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  NavigationRouteNames._internal();
  static final NavigationRouteNames _instance =
      NavigationRouteNames._internal();

  static const String initialRoute = '/';
  static const String weatherDetailsPage = '/weather-details';
  static const String bookmarkPage = '/bookmark';
}
