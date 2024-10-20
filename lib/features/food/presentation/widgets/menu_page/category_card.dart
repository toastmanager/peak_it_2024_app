import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.imageUrl, required this.text});

  final String imageUrl;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8)),
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          imageUrl.startsWith('assets/')
              ? Image.asset(imageUrl, height: 39)
              : CachedNetworkImage(
                  alignment: Alignment.center,
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const Icon(Icons.food_bank_rounded),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.food_bank_rounded),
                  height: 39,
                ),
          Text(text)
        ],
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Long without image', type: CategoryCard)
CategoryCard longCategoryWithoutImage(BuildContext context) {
  return const CategoryCard(imageUrl: '', text: 'Морепродукты');
}

@widgetbook.UseCase(name: 'Short without image', type: CategoryCard)
CategoryCard shortCategoryWithoutImage(BuildContext context) {
  return const CategoryCard(imageUrl: '', text: 'Лапша');
}
