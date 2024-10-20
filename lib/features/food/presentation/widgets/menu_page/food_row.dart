import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/menu_page/food_card.dart';

class FoodRow extends StatelessWidget {
  const FoodRow({
    super.key,
    required this.text,
    required this.items,
  });

  final String text;
  final List<FoodEntity> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 231,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FoodCard(entity: items[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemCount: items.length),
        ),
      ],
    );
  }
}
