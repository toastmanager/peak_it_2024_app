import 'package:equatable/equatable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';

class CartItem extends Equatable {
  final FoodEntity entity;
  final int quantity;

  const CartItem({required this.entity, required this.quantity});

  CartItem copyWith({FoodEntity? entity, int? quantity}) {
    return CartItem(
        entity: entity ?? this.entity, quantity: quantity ?? this.quantity);
  }

  @override
  List<Object?> get props => [entity, quantity];
}
