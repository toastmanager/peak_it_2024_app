import 'package:peak_it_2024_app/features/food/domain/entites/food_order_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/repositories/food_repository.dart';

class OrderFood {
  final FoodRepository repository;

  const OrderFood({required this.repository});

  Future<bool> execute(List<FoodOrderEntity> food) async =>
      await repository.orderFood(food);
}
