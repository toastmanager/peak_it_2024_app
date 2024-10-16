import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/repositories/food_repository.dart';

@singleton
class GetCategories {
  final FoodRepository repository;

  const GetCategories({required this.repository});

  Future<List<FoodCategoryEntity>> execute() async =>
      await repository.getCategories();
}
