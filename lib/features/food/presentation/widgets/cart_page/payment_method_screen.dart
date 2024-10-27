import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/payment_method_button.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Выберите способ оплаты',
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16 ),
              PaymentMethodButton(
                  picture: Image.asset('assets/images/supported_cards.png'),
                  paymentName: 'Банковская карта',
                  description: 'привязать банковскую карту'),
              const SizedBox(height: 8),
              PaymentMethodButton(
                  picture: SvgPicture.asset('assets/icons/bill.svg'),
                  paymentName: 'Оплата наличными',
                  description: 'заплатите при получении заказа'),
            ],
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
                        'Заказать • ${state.totalPrice} ${FoodUtils.getCurrency()}'));
              }
              return const Text('Unexpected Error');
            },
          ),
        ),
      ],
    );
  }
}
