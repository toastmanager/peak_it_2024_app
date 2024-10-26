import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/cart_items_screen.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/empty_cart_screen.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/order_details.dart';
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

    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        final tabController = DefaultTabController.of(context);
        return BlocConsumer<CartBloc, CartState>(
          listener: (context, state) {
            if (state is CartUpdating) {
              tabController.animateTo(0);
              setState(() => tabIndex = 0);
            }
          },
          builder: (context, state) {
            if (state is CartUpdated && state.cart.isEmpty) {
              return const EmptyCartScreen();
            }
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (tabIndex > 0)
                        IconButton(
                            onPressed: () {
                              tabController.animateTo(tabIndex - 1);
                              setState(() => tabIndex -= 1);
                            },
                            icon: const Icon(Icons.arrow_back)),
                      const Spacer(),
                      OrderProgressIndicator(
                          textTheme: textTheme,
                          tabIndex: tabIndex,
                          colors: colors),
                      const Spacer(),
                      if (tabIndex > 0)
                        IconButton(
                            onPressed: () {},
                            color: Colors.transparent,
                            icon: const Icon(Icons.arrow_back)),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          CartItemsScreen(
                            onPressed: () {
                              tabController.animateTo(1);
                              setState(() => tabIndex = 1);
                            },
                          ),
                          OrderDetailsScreen(
                            onPressed: () {
                              tabController.animateTo(2);
                              setState(() => tabIndex = 2);
                            },
                          ),
                          const Placeholder(),
                        ]),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
