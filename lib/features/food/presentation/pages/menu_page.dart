import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/food/food_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/menu_page/menu_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    return BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodLoading || state is FoodInitial) {
                  return Skeletonizer(
                    enabled: true,
                    child: MenuScreen(
                        categories: List.generate(
                      8,
                      (index) => FoodCategoryEntity(
                          id: index,
                          imageUrl: "",
                          name: "asdfasd",
                          food: List.generate(
                            12,
                            (index) => FoodEntity(
                                id: index,
                                imageUrl: "asdfasdf",
                                name: "asfdsdf",
                                price: 512,
                                weight: 512,
                                sharpness: random.nextInt(3)),
                          )),
                    )),
                  );
                }

                if (state is FoodFailed) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is FoodLoaded) {
                  return MenuScreen(categories: state.categories);
                }

                return const Center(child: Text("Unexpected error"));
              },
            )),
      );
    });
  }
}
