import 'package:flutter/material.dart';
import 'package:kisaan_konnect/constants/colors.dart';

void ShowSnackBar(BuildContext context, String title, Color bgColor) {
  SnackBar snackBar = SnackBar(
    content: Text(
      title,
      style: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: AppColors.white),
    ),
    backgroundColor: bgColor,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
