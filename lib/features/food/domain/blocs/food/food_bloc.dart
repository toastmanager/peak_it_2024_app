import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_category_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/entites/food_entity.dart';
import 'package:peak_it_2024_app/features/food/domain/usecases/get_categories.dart';
import 'package:peak_it_2024_app/features/food/domain/usecases/order_food.dart';

part 'food_event.dart';
part 'food_state.dart';

@injectable
class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final GetCategories getCategories;
  final OrderFood orderFood;
  final Logger logger;

  FoodBloc(
      {required this.getCategories,
      required this.orderFood,
      required this.logger})
      : super(FoodInitial()) {
    on<FoodGetCategories>(_onGetCategories);
    on<FoodAddFoodToCart>(_onAddFoodToCart);
    on<FoodRemoveFoodFromCart>(_onRemoveFoodFromCart);
  }

  List<FoodCategoryEntity> categories = [];
  List<FoodEntity> cart = [];

  Future<void> _onGetCategories(
      FoodGetCategories event, Emitter<FoodState> emit) async {
    emit(FoodLoading());
    try {
      final categoriesList = await getCategories.execute();
      categories = categoriesList;
      emit(FoodLoaded(categories: categoriesList));
    } catch (e) {
      emit(FoodFailed(message: e.toString()));
      logger.e(e);
      rethrow;
    }
  }

  void _onAddFoodToCart(FoodAddFoodToCart event, Emitter<FoodState> emit) {
    addFoodToCart(event.categoryIndex, event.foodIndex);
  }

  Future<void> _onRemoveFoodFromCart(
      FoodRemoveFoodFromCart event, Emitter<FoodState> emit) async {
    removeFoodFromCart(event.categoryIndex, event.foodIndex);
  }

  void addFoodToCart(int categoryIndex, int foodIndex) {
    final food = categories[categoryIndex].food[foodIndex];
    final cartIndex = cart.indexWhere((el) => el.id == food.id);
    if (cartIndex == -1) {
      cart.add(food);
    } else {
      cart[cartIndex] = food.copyWith(number: food.number + 1);
      categories[categoryIndex].food[foodIndex] = cart[cartIndex];
    }
  }

  void removeFoodFromCart(int categoryIndex, int foodIndex) {
    final food = categories[categoryIndex].food[foodIndex];
    final cartIndex = cart.indexWhere((el) => el.id == food.id);
    if (cartIndex == -1) {
      const errorMessage = "Tried to remove non-existing in cart food";
      logger.e(errorMessage);
      throw Exception(errorMessage);
    } else {
      if (food.number == 1) {
        cart.removeAt(cartIndex);
      } else {
        cart[cartIndex] = food.copyWith(number: food.number - 1);
        categories[categoryIndex].food[foodIndex] = cart[cartIndex];
      }
    }
  }
}
