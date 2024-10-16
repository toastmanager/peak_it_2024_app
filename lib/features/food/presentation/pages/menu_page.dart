import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peak_it_2024_app/features/food/domain/blocs/food/food_bloc.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/category_card.dart';
import 'package:peak_it_2024_app/features/food/presentation/widgets/food_row.dart';

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
        child: BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is FoodFailed) {
              return Center(
                child: Text(state.message),
              );
            }

            if (state is FoodLoaded) {
              return Column(
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
                  ...state.categories
                      .map((e) => FoodRow(text: e.name, items: e.food)),
                ],
              );
            }

            return const Center(child: Text("Unexpected error"));
          },
        ),
      ),
    );
  }
}
