import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/states/product.state.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';
import 'package:kisaan_konnect/services/product.service.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(InitialProductState()) {
    getAllProduct();
  }

  List<Category> items = [];

  void getAllProduct() async {
    emit(LoadingProductState());
    try {
      items = await ProductService().getItems();
      print(items);
      emit(DoneProductState());
    } catch (e) {
      print(e);
      emit(ErrorProductState(err: e.toString()));
    }
  }
}
