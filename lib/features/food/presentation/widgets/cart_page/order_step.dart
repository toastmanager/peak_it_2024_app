import 'package:flutter/material.dart';

class OrderStep extends StatelessWidget {
  const OrderStep({
    super.key,
    required this.stepIndex,
    required this.isDone,
  });

  final int stepIndex;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    final TextTheme fonts = Theme.of(context).textTheme;
    final ColorScheme colors = Theme.of(context).colorScheme;
    final Color color = isDone ? colors.primary : colors.onSurfaceVariant;

    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: color, width: 2)),
      padding: const EdgeInsets.symmetric(horizontal: 8.25, vertical: 1.5),
      child:
          Text('$stepIndex', style: fonts.bodyMedium?.copyWith(color: color)),
    );
  }
}
