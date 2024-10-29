extension StringExtensions on String? {
  bool get isTextNullAndEmpty => this == null && this?.isEmpty == true;
  bool get isTextNotNullAndNotEmpty => this != null && this?.isNotEmpty == true;
}

extension xStringExtensions on String {
  String get convertRoutePathToRouteName => replaceAll('/', '');
}
