import 'package:flutter/material.dart';

class PaymentMethodButton extends StatelessWidget {
  const PaymentMethodButton(
      {super.key,
      required this.picture,
      required this.paymentName,
      required this.description});

  final Widget picture;
  final String paymentName;
  final String description;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return FilledButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(colors.surfaceContainer),
          foregroundColor: WidgetStatePropertyAll(colors.onSurface)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 48,
                  child: picture,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      paymentName,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      description,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant
                      ),
                    )
                  ],
                )
              ],
            ),
            const Icon(Icons.arrow_right)
          ],
        ));
  }
}
