part of 'food_bloc.dart';

sealed class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

final class FoodInitial extends FoodState {}

final class FoodLoading extends FoodState {}

final class FoodLoaded extends FoodState {
  final List<FoodCategoryEntity> categories;

  const FoodLoaded({required this.categories});
}

final class FoodFailed extends FoodState {
  final String message;

  const FoodFailed({required this.message});
}
