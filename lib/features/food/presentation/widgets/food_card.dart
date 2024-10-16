import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';
import 'package:peak_it_2024_app/core/utils/icon_paths.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FoodCard extends StatelessWidget {
  const FoodCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.weight,
      this.sharpness = 1});

  final String imageUrl;
  final String name;
  final int price;
  final int weight;
  final int sharpness;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const Icon(Icons.egg_alt),
              errorWidget: (context, url, error) => const Icon(Icons.egg_alt),
              height: 77,
            ),
          ),
          Row(
            children: List.generate(
                sharpness,
                (index) => SvgPicture.asset(
                      IconPaths.flame,
                      height: 14,
                      width: 14,
                      colorFilter: ColorFilter.mode(
                          sharpness == 1
                              ? const Color(0xFFFAC20C)
                              : sharpness == 2
                                  ? Colors.orange
                                  : Colors.red,
                          BlendMode.srcIn),
                    )),
          ),
          const SizedBox(height: 4),
          RichText(
            text: TextSpan(
                text: '$price ${FoodUtils.getCurrency()} ',
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: '$weight г',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  )
                ]),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          ExpandedHorizontally(
            child: FilledButton(onPressed: () {}, child: const Text('Выбрать')),
          )
        ],
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Very Hot', type: FoodCard)
FoodCard veryHotFoodCard(BuildContext context) {
  return const FoodCard(
    imageUrl: '',
    name: 'Утка по пекински',
    price: 589,
    weight: 430,
    sharpness: 3,
  );
}

@widgetbook.UseCase(name: 'Middle Hot', type: FoodCard)
FoodCard middleHotFoodCard(BuildContext context) {
  return const FoodCard(
    imageUrl: '',
    name: 'Гунбао на сковороде',
    price: 479,
    weight: 350,
    sharpness: 2,
  );
}

@widgetbook.UseCase(name: 'Light Hot', type: FoodCard)
FoodCard lightHotFoodCard(BuildContext context) {
  return const FoodCard(imageUrl: '', name: 'Якисоба', price: 419, weight: 450);
}
