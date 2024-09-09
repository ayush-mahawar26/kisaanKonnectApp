import 'package:flutter/material.dart';
import 'package:kisaan_konnect/constants/colors.dart';
import 'package:kisaan_konnect/constants/size.config.dart';
import 'package:kisaan_konnect/models/marketplace.item.model.dart';

class MarketItemWidget extends StatelessWidget {
  Item marketItem;
  MarketItemWidget({super.key, required this.marketItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image.network(
                    fit: BoxFit.cover,
                    marketItem.imageUrl,
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        marketItem.name,
                        style:
                            Theme.of(context).textTheme.bodySmall!.copyWith(),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '2',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: AppColors.secondaryText, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              child: Text(
                "₹ ${marketItem.price}  >",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
