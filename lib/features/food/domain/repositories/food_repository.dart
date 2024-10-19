import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_order_entity.dart';

abstract class FoodRepository {
  Future<List<FoodCategoryEntity>> getCategories();
  Future<bool> orderFood(List<FoodOrderEntity> food);
}
