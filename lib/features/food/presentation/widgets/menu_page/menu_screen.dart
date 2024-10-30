import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/menu_page/category_card.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/menu_page/food_row.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.categories});

  final List<FoodCategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final List<GlobalKey> globalKeys = [];
    for (var _ in categories) {
      globalKeys.add(GlobalKey());
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                    onTap: () => {
                      Scrollable.ensureVisible(
                          globalKeys[index].currentContext!,
                          duration: Durations.medium1)
                    },
                    child: CategoryCard(
                      imageUrl: categories[index].imageUrl,
                      text: categories[index].name,
                    ),
                  ),
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemCount: categories.length),
        ),
        const SizedBox(height: 20),
        ...categories.asMap().entries.map((e) => FoodRow(
            key: globalKeys[e.key], text: e.value.name, items: e.value.food)),
      ],
    );
  }
}
