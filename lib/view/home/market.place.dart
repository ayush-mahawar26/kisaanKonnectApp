import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisaan_konnect/bloc/cubit/product.cubit.dart';
import 'package:kisaan_konnect/bloc/states/product.state.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';
import 'package:kisaan_konnect/view/widgets/items.widget.dart';

class MarketPlaceView extends StatelessWidget {
  const MarketPlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit productBloc = BlocProvider.of<ProductCubit>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Market For you",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocConsumer<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is DoneProductState) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: productBloc.items.length,
                      itemBuilder: (context, index) {
                        Category cat = productBloc.items[index];
                        List<Item> items = cat.items;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cat.title),
                            ListView.builder(
                              itemCount: items.length,
                              shrinkWrap:
                                  true, // Prevent ListView from taking up infinite height
                              physics:
                                  const NeverScrollableScrollPhysics(), // Disable inner scrolling
                              itemBuilder: (context, index) {
                                return MarketItemWidget(
                                    marketItem: items[index]);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }

                if (state is ErrorProductState) {
                  return Center(
                    child: Text(
                      'Error Occured',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.red),
                    ),
                  );
                }
                return const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          color: AppColors.accentMain,
                        ),
                      ),
                    ],
                  ),
                );
              },
              listener: (context, state) {})
        ],
      ),
    ));
  }
}
