import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/cubit/cart.cubit.dart';
import 'package:kisaan_konnect/bloc/cubit/product.cubit.dart';
import 'package:kisaan_konnect/bloc/cubit/quantity.cubit.dart';
import 'package:kisaan_konnect/bloc/states/cart.state.dart';
import 'package:kisaan_konnect/bloc/states/quantity.state.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';
import 'package:kisaan_konnect/utils/snackbar.dart';
import 'package:kisaan_konnect/view/widgets/buttons.dart';

class ProductView extends StatelessWidget {
  Item item;
  ProductView({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    QuantityCubit quantityCubit = BlocProvider.of<QuantityCubit>(context);
    CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(image: AssetImage("assets/image.png")),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    item.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Quantity",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(),
                        ),
                        Row(
                          children: [
                            CustomButtons().customIconButton(Icon(Icons.add),
                                () {
                              quantityCubit.increment();
                            }, 32),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: BlocBuilder<QuantityCubit, QuantityState>(
                                builder: (context, state) {
                                  return Text(
                                    state.qty.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(),
                                  );
                                },
                              ),
                            ),
                            CustomButtons().customIconButton(Icon(Icons.remove),
                                () {
                              quantityCubit.decrement();
                            }, 32),
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) {
                  if (state is ErrorCartState) {
                    ShowSnackBar(context, state.err, Colors.red);
                  }
                  if (state is FetchedCartState) {
                    ShowSnackBar(
                        context, "Item Added to Cart", AppColors.accentMain);
                  }
                }, builder: (context, state) {
                  if (state is LoadingCartState) {
                    return CustomButtons().loadingElevatedButton(8);
                  }
                  return CustomButtons().customElevatedButton("Add Cart",
                      () async {
                    cartCubit.addToCart(item, quantityCubit.state.qty);
                  }, 8);
                })),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child:
                        CustomButtons().customElevatedButton("Buy", () {}, 8)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
