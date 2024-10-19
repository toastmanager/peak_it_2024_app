part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartAddFood extends CartEvent {
  final FoodEntity entity;

  const CartAddFood({required this.entity});
}

class CartRemoveFood extends CartEvent {
  final FoodEntity entity;

  const CartRemoveFood({required this.entity});
}
