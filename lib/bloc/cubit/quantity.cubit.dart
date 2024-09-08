import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/states/quantity.state.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityState(qty: 0));

  increment() {
    emit(QuantityState(qty: state.qty + 1));
  }

  decrement() {
    if (state.qty > 1) emit(QuantityState(qty: state.qty - 1));
  }
}
