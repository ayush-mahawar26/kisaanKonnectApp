import 'package:flutter/material.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/view/widgets/buttons.dart';
import 'package:kisaan_konnect/view/widgets/check.widget.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Empowering Farmers & Promoting Sustainable Agriculture",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                ),
                Text(
                  "Kisaan Konnect is your gateway to modern farming solutions.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.accentMain),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "We are committed to connecting farmers with the latest innovations in sustainable farming, organic products, and agricultural support. Whether you're looking to boost productivity, access financial subsidies, or connect with markets, Kisaan Konnect is here to help.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                const SizedBox(
                  height: 16,
                ),
                checkWidget(context,
                    " Access to the latest agricultural technologies and market insights."),
                checkWidget(context,
                    " Dedicated support for small and large-scale farmers alike."),
              ],
            ),
          ),
          CustomButtons().customElevatedButton(
            "Discover More",
            () {},
            8,
          )
        ],
      ),
    ));
  }
}
