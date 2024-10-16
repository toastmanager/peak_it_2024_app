part of 'food_bloc.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {}

class FoodLoading extends FoodState {}

class FoodLoaded extends FoodState {
  final List<FoodCategoryEntity> categories;

  const FoodLoaded({required this.categories});
}

class FoodFailed extends FoodState {
  final String message;

  const FoodFailed({required this.message});
}
