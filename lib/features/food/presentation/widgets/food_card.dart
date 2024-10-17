import 'package:flutter/material.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/cart_quantity_button.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/sharpness_scale.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

class FoodCard extends StatefulWidget {
  const FoodCard({super.key, required this.entity});

  final FoodEntity entity;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  late final FoodEntity entity;
  late final String imageUrl;
  late final String name;
  late final int price;
  late final int weight;
  late final int sharpness;
  int number = 0;

  @override
  void initState() {
    entity = widget.entity;
    imageUrl = entity.imageUrl;
    name = entity.name;
    price = entity.price;
    weight = entity.weight;
    sharpness = entity.sharpness;
    super.initState();
  }

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(imageUrl, height: 77,),
                // child: CachedNetworkImage(
                //   imageUrl: imageUrl,
                //   placeholder: (context, url) => const Icon(Icons.egg_alt),
                //   errorWidget: (context, url, error) =>
                //       const Icon(Icons.egg_alt_outlined),
                //   height: 77,
                // ),
              ),
              SharpnessScale(sharpness: sharpness),
              const SizedBox(height: 4),
              RichText(
                text: TextSpan(
                    text: '$price ${FoodUtils.getCurrency()} ',
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: '$weight г',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant),
                      )
                    ]),
              ),
              const SizedBox(height: 4),
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          CartQuantityButton(entity: entity)
        ],
      ),
    );
  }
}

@widgetbook.UseCase(name: 'Very Hot', type: FoodCard)
FoodCard veryHotFoodCard(BuildContext context) {
  return const FoodCard(
    entity: FoodEntity(
      imageUrl: '',
      name: 'Утка по пекински',
      price: 589,
      weight: 430,
      sharpness: 3,
      id: 0,
    ),
  );
}

@widgetbook.UseCase(name: 'Middle Hot', type: FoodCard)
FoodCard middleHotFoodCard(BuildContext context) {
  return const FoodCard(
    entity: FoodEntity(
      id: 0,
      imageUrl: '',
      name: 'Гунбао на сковороде',
      price: 479,
      weight: 350,
      sharpness: 2,
    ),
  );
}

@widgetbook.UseCase(name: 'Light Hot', type: FoodCard)
FoodCard lightHotFoodCard(BuildContext context) {
  return const FoodCard(
    entity: FoodEntity(
        id: 0,
        imageUrl: '',
        name: 'Якисоба',
        price: 419,
        weight: 450,
        sharpness: 1),
  );
}
