import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:kisaan_konnect/bloc/states/predicting.states.dart';
import 'package:kisaan_konnect/services/predicting.service.dart';

class PredictingCubit extends Cubit<PredictingStates> {
  PredictingCubit() : super(PridictingInitialState());

  Map<String, dynamic> fertilizerRes = {};

  void predictFertilizer(int temp, int hum, int moisture, String soilType,
      String croptype, int nitrogen, int potassium, int phos) async {
    emit(PridictingLoadingState());
    Response? res = await PredictingService().predictFertilizer(
        temp, hum, moisture, soilType, croptype, nitrogen, potassium, phos);

    if (res != null) {
      Map<String, dynamic> resbody = await jsonDecode(res.body);
      fertilizerRes = resbody;
      emit(PridictingDoneState());
    } else {
      emit(PredictingErrorState(err: "Something wrong with server"));
    }
  }
}
