import 'package:flutter/material.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/constants/size.config.dart';

Widget checkWidget(BuildContext context, String title) {
  return Row(
    children: [
      const Icon(
        Icons.check,
        color: AppColors.accentMain,
      ),
      SizedBox(
        width: AppSizeConfig.screenWidth * 0.9,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.accentMain),
        ),
      )
    ],
  );
}
