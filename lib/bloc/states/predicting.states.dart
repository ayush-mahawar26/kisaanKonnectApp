abstract class PredictingStates {}

class PridictingDoneState extends PredictingStates {}

class PridictingLoadingState extends PredictingStates {}

class PredictingErrorState extends PredictingStates {
  String err;
  PredictingErrorState({required this.err});
}

class PridictingInitialState extends PredictingStates {}
