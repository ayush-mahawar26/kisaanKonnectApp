import 'package:flutter/material.dart';
import 'package:kisaan_konnect/view/home/cart.view.dart';

class CustomAppbar {
  AppBar marketPlaceAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "Market Place",
        style: Theme.of(context).textTheme.bodySmall!.copyWith(),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CartView()));
              },
              child: Icon(Icons.shopping_cart)),
        )
      ],
    );
  }
}
