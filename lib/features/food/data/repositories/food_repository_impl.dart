import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_order_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/repositories/food_repository.dart';

@Singleton(as: FoodRepository)
class FoodRepositoryImpl implements FoodRepository {
  FoodRepositoryImpl();

  @override
  Future<List<FoodCategoryEntity>> getCategories() async {
    // TODO: implement getCategories
    return List.generate(
      11,
      (index) => FoodCategoryEntity(
          id: index,
          name: 'Колонна',
          food: List.generate(
              11,
              (index) => FoodEntity(
                  id: index,
                  imageUrl: '',
                  name: 'Название',
                  price: 123,
                  weight: 124,
                  sharpness: 3))),
    );
  }

  @override
  Future<bool> orderFood(List<FoodOrderEntity> food) {
    // TODO: implement orderFood
    throw UnimplementedError();
  }
}
