import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';

enum DeliveryType { delivery, pickup }

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late DeliveryType deliveryType = DeliveryType.delivery;

  ButtonStyle buttonStyleByDeliveryType(
      {required DeliveryType type, required ColorScheme colors}) {
    return ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
          deliveryType == type ? colors.primary : colors.surfaceContainer),
      foregroundColor: WidgetStatePropertyAll(
          deliveryType == type ? colors.onPrimary : colors.onSurface),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: () =>
                        setState(() => deliveryType = DeliveryType.delivery),
                    style: buttonStyleByDeliveryType(
                        type: DeliveryType.delivery, colors: colors),
                    child: const Text('Доставка'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                      onPressed: () =>
                          setState(() => deliveryType = DeliveryType.pickup),
                      style: buttonStyleByDeliveryType(
                          type: DeliveryType.pickup, colors: colors),
                      child: const Text('Самовывоз')),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                deliveryType == DeliveryType.delivery
                    ? 'Адрес доставки'
                    : 'Заказ будет ждать здесь',
                style:
                    textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: FilledButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  WidgetStatePropertyAll(colors.onSurface),
                              backgroundColor: WidgetStatePropertyAll(
                                  colors.surfaceContainer)),
                          onPressed: () {},
                          child: Text(
                            deliveryType == DeliveryType.delivery
                                ? 'Сменить адрес'
                                : 'Сменить ресторан',
                          ))),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: FilledButton(
                          onPressed: () {},
                          child: Text(
                            deliveryType == DeliveryType.delivery
                                ? 'Определить'
                                : 'Выбрать ближайшее',
                          )))
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                    style: textTheme.titleLarge?.copyWith(
                        color: colors.onSurface, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: deliveryType == DeliveryType.delivery
                            ? 'Время прибытия'
                            : 'Начнём готовить',
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                          text: deliveryType == DeliveryType.delivery
                              ? 'ближайшее'
                              : 'сейчас',
                          style: textTheme.titleLarge?.copyWith(
                              color: colors.primary,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'изменить время',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colors.onSurfaceVariant),
                  )),
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
                    onPressed: widget.onPressed,
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
