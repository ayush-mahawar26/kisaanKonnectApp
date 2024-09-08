import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:kisaan_konnect/bloc/states/cart.state.dart';
import 'package:kisaan_konnect/models/cart.model.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';
import 'package:kisaan_konnect/services/cart.service.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialCartState());

  List<Cart> cartItems = [];

  void getCartItems() async {
    try {
      Response? cartRes = await CartService().getAllCart();
      if (cartRes != null) {
        Map<String, dynamic> jsonCart = await jsonDecode(cartRes.body);
        List<dynamic> data = jsonCart['cart'];
        print(data);
        cartItems = data.map((item) => Cart.fromMap(item)).toList();
        emit(FetchedCartState());
      } else {
        emit(ErrorCartState(err: "User token is not found"));
      }
    } catch (e) {
      emit(ErrorCartState(err: "Some Error Occured"));
    }
  }

  void addToCart(Item item, int qty) async {
    emit(LoadingCartState());

    try {
      Response? cartRes = await CartService().addtoCart(item, qty);
      print(cartRes!.body);
      if (cartRes != null) {
        Map<String, dynamic> jsonCart = await jsonDecode(cartRes.body);
        if (jsonCart['cart'] == null) {
          emit(ErrorCartState(err: jsonCart["message"]));
        } else {
          emit(FetchedCartState());
        }
      } else {
        emit(ErrorCartState(err: "User token is not found"));
      }
    } catch (e) {
      emit(ErrorCartState(err: "Some Error Occured"));
    }
  }
}
