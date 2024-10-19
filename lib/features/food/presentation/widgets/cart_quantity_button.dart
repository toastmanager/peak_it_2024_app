import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:smooth_corner/smooth_corner.dart';

class CartQuantityButton extends StatefulWidget {
  const CartQuantityButton(
      {super.key, required this.entity});

  final FoodEntity entity;

  @override
  State<CartQuantityButton> createState() => _CartQuantityButtonState();
}

class _CartQuantityButtonState extends State<CartQuantityButton> {
  late final FoodEntity entity;
  late final String imageUrl;
  late final String name;
  late final int price;
  late final int weight;
  late final int sharpness;

  @override
  void initState() {
    entity = widget.entity;
    imageUrl = entity.imageUrl;
    name = entity.name;
    price = entity.price;
    weight = entity.weight;
    sharpness = entity.sharpness;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          final bloc = context.read<CartBloc>();
          final cartEntity = state.cart[entity.id];
          int quantity = cartEntity != null ? cartEntity.quantity : 0;
          return quantity == 0
              ? FilledButton(
                  onPressed: () {
                    bloc.add(CartAddFood(entity: entity));
                    setState(() {
                      quantity++;
                    });
                  },
                  child: const Text('Выбрать'))
              : SmoothClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  smoothness: 0.6,
                  child: Container(
                    color: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              bloc.add(CartRemoveFood(entity: entity));
                              setState(() {
                                quantity--;
                              });
                            },
                            child: SizedBox(
                              width: 40,
                              child: Center(
                                child: Text(
                                  '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary),
                                ),
                              ),
                            )),
                        Text('$quantity',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                        InkWell(
                            onTap: () {
                              bloc.add(CartAddFood(entity: entity));
                              setState(() {
                                quantity++;
                              });
                            },
                            child: SizedBox(
                              width: 40,
                              child: Center(
                                child: Text('+',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary)),
                              ),
                            )),
                      ],
                    ),
                  ),
                );
        }
        return const Text('Error');
      },
    );
  }
}
