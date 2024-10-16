import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/category_card.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/food_card.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const CategoryCard(
                        imageUrl: '',
                        text: 'Лапша',
                      ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: 11),
            ),
            const SizedBox(height: 20),
            const FoodRow(text: 'Самое полуярное', items: [],),
          ],
        ),
      ),
    );
  }
}

class FoodRow extends StatelessWidget {
  const FoodRow({
    super.key,
    required this.text,
    required this.items,
  });

  final String text;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Самое популярное',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        SizedBox(
          height: 231,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const FoodCard(
                    imageUrl: '',
                    name: 'Гунбао на сковороде',
                    price: 479,
                    weight: 430,
                    sharpness: 1,
                  ),
              separatorBuilder: (context, index) =>
                  const SizedBox(width: 12),
              itemCount: 11),
        ),
      ],
    );
  }
}
