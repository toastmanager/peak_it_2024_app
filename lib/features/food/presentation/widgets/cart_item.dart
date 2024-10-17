import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_quantity_button.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/sharpness_scale.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.entity, this.quantity = 0});

  final FoodEntity entity;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 110,
                  child: Center(
                    child: Image.asset(entity.imageUrl),
                    // child: CachedNetworkImage(
                    //   imageUrl: entity.imageUrl,
                    //   fit: BoxFit.cover,
                    //   errorWidget: (context, url, error) =>
                    //       const Icon(Icons.egg_alt),
                    // ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SharpnessScale(sharpness: entity.sharpness),
                      Text(entity.name, style: Theme.of(context).textTheme.bodyMedium,),
                      RichText(
                        text: TextSpan(
                            text: '${entity.price} ${FoodUtils.getCurrency()} ',
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: '${entity.weight} г',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant),
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(child: CartQuantityButton(entity: entity)),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                      text:
                          '${entity.price * quantity} ${FoodUtils.getCurrency()} ',
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        TextSpan(
                          text: '${entity.weight * quantity} г',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant),
                        )
                      ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
