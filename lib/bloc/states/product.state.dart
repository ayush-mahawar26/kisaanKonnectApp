import 'package:kisaan_konnect/models/marketplace.item.model.dart';

abstract class ProductState {}

class InitialProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  String err;
  ErrorProductState({required this.err});
}

class DoneProductState extends ProductState {}
