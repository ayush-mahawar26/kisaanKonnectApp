import 'package:flutter/material.dart';
import 'package:kisaan_konnect/constants/colors.dart';

class CustomButtons {
  Widget customElevatedButton(
      String title, Function function, double borderRadius) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.accentMain),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)))),
      onPressed: () => function(),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          )),
    );
  }

  Widget loadingElevatedButton(double borderRadius) {
    return ElevatedButton(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.white),
          backgroundColor: WidgetStateProperty.all(AppColors.accentMain),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius)))),
      onPressed: () {},
      child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: CircularProgressIndicator(
            color: AppColors.white,
          )),
    );
  }
}
