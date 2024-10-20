import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset('assets/images/waving_panda.svg'),
                const SizedBox(height: 20),
                Text(
                  'Ваша корзина пуста',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'скорее переходите в меню и заказывайте\nвкусные блюда!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color:
                          Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                const Spacer(),
                ExpandedHorizontally(
                    child: FilledButton(
                        onPressed: () =>
                            AutoTabsRouter.of(context).setActiveIndex(0),
                        child: const Text('Меню')))
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 0.5))),
        )
      ],
    );
  }
}
