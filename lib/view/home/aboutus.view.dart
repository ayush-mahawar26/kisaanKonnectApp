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
                  "Agriculture & Organic Product Farm",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
                ),
                Text(
                  "Agrios is the largest global organic farm.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.accentMain),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "There are many variations of passages of lorem ipsum available but the majority have suffered alteration in some form by injected humor or random word which don't look even.",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                const SizedBox(
                  height: 16,
                ),
                checkWidget(context, " Lorem Ipsum is not simply random text."),
                checkWidget(context,
                    " Making this the first true generator on the internet."),
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
