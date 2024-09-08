import 'package:kisaan_konnect/models/cart.model.dart';

abstract class CartState {}

class InitialCartState extends CartState {}

class LoadingCartState extends CartState {}

class ErrorCartState extends CartState {
  String err;
  ErrorCartState({required this.err});
}

class FetchedCartState extends CartState {}
