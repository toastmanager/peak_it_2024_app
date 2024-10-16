import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:peak_it_2024_app/core/components/expanded_horizontal.dart';
import 'package:peak_it_2024_app/core/utils/icon_paths.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/cart/cart_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/utils/food_utils.dart';
import 'package:smooth_corner/smooth_corner.dart';
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) => const Icon(Icons.egg_alt),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.egg_alt),
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
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              final bloc = context.read<CartBloc>();
              return ExpandedHorizontally(
                child: number == 0
                    ? FilledButton(
                        onPressed: () {
                          bloc.add(CartAddFood(entity: entity));
                          setState(() {
                            number++;
                          });
                        },
                        child: const Text('Выбрать'))
                    : SmoothClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        smoothness: 0.6,
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () {
                                    bloc.add(CartRemoveFood(entity: entity));
                                    setState(() {
                                      number--;
                                    });
                                  },
                                  child: Text(
                                    '-',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary),
                                  )),
                              Text('$number',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary)),
                              InkWell(
                                  onTap: () {
                                    bloc.add(CartAddFood(entity: entity));
                                    setState(() {
                                      number++;
                                    });
                                  },
                                  child: Text('+',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary))),
                            ],
                          ),
                        ),
                      ),
              );
            },
          )
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
