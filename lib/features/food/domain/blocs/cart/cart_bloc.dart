import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/cart_item.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartUpdated(cart: {}, totalPrice: 0)) {
    on<CartAddFood>(_onAddFood);
    on<CartRemoveFood>(_onRemoveFood);
  }

  Map<int, CartItem> cart = {};
  int totalPrice = 0;

  void _onAddFood(CartAddFood event, Emitter<CartState> emit) {
    emit(CartUpdating());
    addFoodToCart(event.entity);
    emit(CartUpdated(cart: Map.from(cart), totalPrice: totalPrice));
  }

  void _onRemoveFood(CartRemoveFood event, Emitter<CartState> emit) {
    emit(CartUpdating());
    removeFoodFromCart(event.entity);
    emit(CartUpdated(cart: Map.from(cart), totalPrice: totalPrice));
  }

  void addFoodToCart(FoodEntity entity) {
    int prevValue = 0;
    if (cart[entity.id] != null) {
      prevValue = cart[entity.id]!.quantity;
    }
    totalPrice += entity.price;
    cart[entity.id] = CartItem(entity: entity, quantity: prevValue + 1);
  }

  void removeFoodFromCart(FoodEntity entity) {
    int prevValue = 0;
    if (cart[entity.id] == null) {
      throw Exception();
    }
    totalPrice -= entity.price;
    prevValue = cart[entity.id]!.quantity;
    if (prevValue == 1) {
      cart.remove(entity.id);
      return;
    }
    cart[entity.id] = CartItem(entity: entity, quantity: prevValue - 1);
  }
}
