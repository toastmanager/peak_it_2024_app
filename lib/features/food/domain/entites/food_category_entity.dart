import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';

class FoodCategoryEntity extends Equatable {
  final int id;
  final String name;
  final String imageUrl;
  final List<FoodEntity> food;

  const FoodCategoryEntity(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.food});

  @override
  List<Object?> get props => [id, name, food];

  @override
  String toString() {
    return 'FoodCategoryEntity{id=$id, name=$name, food=$food}';
  }

  FoodCategoryEntity copyWith(
      {int? id, String? name, String? imageUrl, List<FoodEntity>? food}) {
    return FoodCategoryEntity(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        name: name ?? this.name,
        food: food ?? this.food);
  }
}
