import 'package:flutter/material.dart';
import 'package:my_markit/core/utils/app_styls.dart';

class ErrorText extends StatelessWidget {
  final String errorMessage;
  const ErrorText({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: AppStyle.style20Bold(context),
      ),
    );
  }
}
