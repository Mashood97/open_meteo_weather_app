import 'package:flutter/material.dart';

class AppError extends StatelessWidget {

  const AppError({
    super.key,
    this.errorMessage = 'No Data Found',
  });
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
