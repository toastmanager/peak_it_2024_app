part of 'food_bloc.dart';

sealed class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object> get props => [];
}

class FoodGetCategories extends FoodEvent {}

class FoodAddFoodToCart extends FoodEvent {
  final int categoryIndex;
  final int foodIndex;

  const FoodAddFoodToCart({required this.categoryIndex, required this.foodIndex});
}

class FoodRemoveFoodFromCart extends FoodEvent {
  final int categoryIndex;
  final int foodIndex;

  const FoodRemoveFoodFromCart({required this.categoryIndex, required this.foodIndex});
}