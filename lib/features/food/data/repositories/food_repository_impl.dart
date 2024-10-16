import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_order_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/repositories/food_repository.dart';

@Singleton(as: FoodRepository)
class FoodRepositoryImpl implements FoodRepository {
  @override
  Future<List<FoodCategoryEntity>> getCategories() async {
    // TODO: implement getCategories
    return List.filled(
        3,
        FoodCategoryEntity(
            id: 0,
            name: 'Колонна',
            food: List.filled(
                11,
                const FoodEntity(
                    id: 1,
                    imageUrl: '',
                    name: 'Название',
                    price: 123,
                    weight: 124,
                    sharpness: 3,
                    number: 0))));
  }

  @override
  Future<bool> orderFood(List<FoodOrderEntity> food) {
    // TODO: implement orderFood
    throw UnimplementedError();
  }
}
