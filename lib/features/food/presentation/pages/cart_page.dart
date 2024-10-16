import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          final cart = state.cart;
          final keys = cart.keys.toList();
          return ListView.separated(
              itemBuilder: (context, index) {
                final id = keys[index];
                final entity = cart[id]!.entity;
                return ListTile(
                  title: Text(entity.name),
                  subtitle: Text('${cart[id]!.quantity}'),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemCount: cart.length);
        }
        return const Text('Unexpected error');
      },
    );
  }
}
