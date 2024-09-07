import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/constants/size.config.dart';

Widget serviceCard(BuildContext context, String title, String description,
    String imgPath, String iconPath) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(imgPath),
              height: AppSizeConfig.screenWidth / 2,
              width: AppSizeConfig.screenWidth,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                SvgPicture.asset(
                  iconPath,
                  color: AppColors.accentMain,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.secondaryText),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    ),
  );
}
