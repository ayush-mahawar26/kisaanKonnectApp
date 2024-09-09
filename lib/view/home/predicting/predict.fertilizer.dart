import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/cubit/predicting.cubit.dart';
import 'package:kisaan_konnect/bloc/states/predicting.states.dart';
import 'package:kisaan_konnect/view/widgets/buttons.dart';
import 'package:kisaan_konnect/view/widgets/textfeild.dart';

class PredictFertilizerView extends StatefulWidget {
  const PredictFertilizerView({super.key});

  @override
  State<PredictFertilizerView> createState() => _PredictFertilizerViewState();
}

class _PredictFertilizerViewState extends State<PredictFertilizerView> {
  TextEditingController temperatureController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController moistureController = TextEditingController();
  TextEditingController soilTypeController = TextEditingController();
  TextEditingController cropTypeController = TextEditingController();
  TextEditingController nitrogenController = TextEditingController();
  TextEditingController potassiumController = TextEditingController();
  TextEditingController phosphorousController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PredictingCubit predictingCubit = BlocProvider.of<PredictingCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Predict Fertilizer",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customTextFeild(
                context, temperatureController, "temperature", "Temperature"),
            customTextFeild(
                context, humidityController, "humidity", "Humidity"),
            customTextFeild(
                context, moistureController, "moisture", "Moisture"),
            customTextFeild(
                context, soilTypeController, "soilType", "Soil Type"),
            customTextFeild(
                context, cropTypeController, "cropType", "Crop Type"),
            customTextFeild(
                context, nitrogenController, "nitrogen", "Nitrogen"),
            customTextFeild(
                context, potassiumController, "potassium", "Potassium"),
            customTextFeild(
                context, phosphorousController, "phosphorous", "Phosphorous"),
            CustomButtons().customElevatedButton("Submit", () async {
              predictingCubit.predictFertilizer(
                  int.parse(temperatureController.text.trim()),
                  int.parse(humidityController.text.trim()),
                  int.parse(moistureController.text.trim()),
                  soilTypeController.text.trim(),
                  cropTypeController.text.trim(),
                  int.parse(nitrogenController.text.trim()),
                  int.parse(potassiumController.text.trim()),
                  int.parse(phosphorousController.text.trim()));
            }, 8),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<PredictingCubit, PredictingStates>(
                builder: (context, state) {
              if (state is PridictingDoneState) {
                return Text(
                  "Fertilizer : ${predictingCubit.fertilizerRes["prediction"]}",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                );
              }

              if (state is PridictingInitialState) {
                return const SizedBox();
              }

              if (state is PredictingErrorState) {
                return Center(
                  child: Text(state.err),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            })
          ],
        ),
      ),
    );
  }
}
