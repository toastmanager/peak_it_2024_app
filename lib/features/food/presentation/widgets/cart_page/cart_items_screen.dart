import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/cart_item.dart';

class CartItemsScreen extends StatelessWidget {
  const CartItemsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Заказ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartUpdated) {
                      final cart = state.cart;
                      final keys = cart.keys.toList();
                      return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final id = keys[index];
                            final entity = cart[id]!.entity;
                            return CartItem(
                                key: Key('${entity.id}'),
                                entity: entity,
                                quantity: cart[id]!.quantity);
                          },
                          separatorBuilder: (context, index) =>
                              const Divider(),
                          itemCount: cart.length);
                    }
                    return const Text('Unexpected error');
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainer,
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context).dividerColor, width: 0.5))),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartUpdated) {
                return FilledButton(
                    onPressed: () {},
                    child: Text(
                        'Далее • ${state.totalPrice} ${FoodUtils.getCurrency()}'));
              }
              return const Text('Unexpected Error');
            },
          ),
        ),
      ],
    );
  }
}
