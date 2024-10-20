import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_page/order_step.dart';

class OrderProgressIndicator extends StatelessWidget {
  const OrderProgressIndicator({
    super.key,
    required this.textTheme,
    required this.tabIndex,
    required this.colors,
  });

  final TextTheme textTheme;
  final int tabIndex;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Мой заказ',
                  style: textTheme.bodyMedium
                      ?.copyWith(color: tabIndex >= 0 ? colors.primary :  colors.onSurfaceVariant)),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text('Детали',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: tabIndex >= 1 ? colors.primary :  colors.onSurfaceVariant)),
              ),
              Text('Оплата',
                  style: textTheme.bodyMedium
                      ?.copyWith(color: tabIndex >= 2 ? colors.primary :  colors.onSurfaceVariant)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: OrderStep(isDone: tabIndex >= 0, stepIndex: 1),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: tabIndex >= 1 ? colors.primary :  colors.onSurfaceVariant, width: 1)),
                ),
              ),
              OrderStep(isDone: tabIndex >= 1, stepIndex: 2),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: tabIndex >= 2 ? colors.primary :  colors.onSurfaceVariant, width: 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: OrderStep(isDone: tabIndex >= 2, stepIndex: 3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}