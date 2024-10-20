import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/cart_items_screen.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/empty_cart_screen.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/order_progress_indicator.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int tabIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colors = Theme.of(context).colorScheme;


    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdated && state.cart.isEmpty) {
          return const EmptyCartScreen();
        }
        final steps = [
          const CartItemsScreen(),
          const Placeholder(),
          const Placeholder(),
        ];
        return Column(
          children: [
            OrderProgressIndicator(textTheme: textTheme, tabIndex: tabIndex, colors: colors),
            DefaultTabController(
                length: 3,
                child: Expanded(
                  child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: steps),
                )),
          ],
        );
      },
    );
  }
}