part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartUpdated extends CartState {
  final Map<int, CartItem> cart;
  final int totalPrice;

  const CartUpdated({required this.cart, required this.totalPrice});
}

final class CartUpdating extends CartState {}