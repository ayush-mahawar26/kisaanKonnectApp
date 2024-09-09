import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/retry.dart';
import 'package:kisaan_konnect/bloc/cubit/cart.cubit.dart';
import 'package:kisaan_konnect/bloc/states/cart.state.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/constants/size.config.dart';
import 'package:kisaan_konnect/utils/snackbar.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    cartCubit.getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: BlocConsumer<CartCubit, CartState>(builder: (context, state) {
        if (state is FetchedCartState) {
          return (cartCubit.cartItems.isEmpty)
              ? Center(
                  child: Text(
                    'Cart is Empty !',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.secondaryText),
                  ),
                )
              : ListView.builder(
                  itemCount: cartCubit.cartItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: AppSizeConfig.screenWidth * 0.4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartCubit.cartItems[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      "Quantity : ${cartCubit.cartItems[index].quantity}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.secondaryText),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "₹ ${cartCubit.cartItems[index].price.toString()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColors.secondaryText,
                                        fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
        }

        if (state is ErrorCartState) {
          return Center(
            child: Text(state.err),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      }, listener: (context, state) {
        if (state is ErrorCartState) {
          ShowSnackBar(context, state.err, Colors.red);
        }
      }),
    );
  }
}
