import 'package:flutter/material.dart';
import 'package:kisaan_konnect/view/home/predicting/predict.fertilizer.dart';
import 'package:kisaan_konnect/view/widgets/service.card.dart';

class ServiceView extends StatelessWidget {
  const ServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   "What we offer",
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyMedium!
            //       .copyWith(fontWeight: FontWeight.bold),
            // ),
            serviceCard(
                context,
                "Crop Disease Prediction",
                "Predict potential crop diseases early to prevent crop loss and increase yield.",
                "assets/CropDiseaseImage.png",
                "assets/crop.svg"),
            serviceCard(
                context,
                "What Crop to Grow",
                "Get recommendations on the best crops to grow based on soil, weather, and market demand.",
                "assets/crop.jpg",
                "assets/crop.svg"),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PredictFertilizerView()));
              },
              child: serviceCard(
                  context,
                  "Fertilizer Prediction",
                  "Receive personalized fertilizer recommendations to optimize crop growth and reduce costs.",
                  "assets/fert.jpg",
                  "assets/crop.svg"),
            )
          ],
        ),
      ),
    ));
  }
}
