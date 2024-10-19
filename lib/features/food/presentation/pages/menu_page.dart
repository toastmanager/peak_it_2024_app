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
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: BlocBuilder<FoodBloc, FoodState>(
            builder: (context, state) {
              if (state is FoodLoading || state is FoodInitial) {
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
                final List<GlobalKey> globalKeys = [];
                for (var _ in state.categories) {
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
                                      globalKeys[index].currentContext!)
                                },
                                child: CategoryCard(
                                  imageUrl: state.categories[index].imageUrl,
                                  text: state.categories[index].name,
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 8),
                          itemCount: state.categories.length),
                    ),
                    const SizedBox(height: 20),
                    ...state.categories.asMap().entries.map((e) => FoodRow(
                        key: globalKeys[e.key],
                        text: e.value.name,
                        items: e.value.food)),
                  ],
                );
              }

              return const Center(child: Text("Unexpected error"));
            },
          )),
    );
  }
}
